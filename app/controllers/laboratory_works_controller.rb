class LaboratoryWorksController < ApplicationController
  # GET /laboratory_works
  # GET /laboratory_works.json
  def index
    if student_signed_in?
      @laboratory_works = current_student.laboratory_works
    elsif teacher_signed_in?
      @laboratory_works = current_teacher.laboratory_works
    end
  end

  # GET /laboratory_works/1
  # GET /laboratory_works/1.json
  def show
    if student_signed_in?
      set_laboratory_work_for_student
    elsif teacher_signed_in?
      set_laboratory_work_for_teacher
    end
  end

  # GET /laboratory_works/new
  def new
    if student_signed_in?
      @laboratory_work = current_student.laboratory_works.build
    elsif teacher_signed_in?
      @laboratory_work = current_teacher.laboratory_works.build
    end
  end

  # GET /laboratory_works/1/edit
  def edit
    if student_signed_in?
      set_laboratory_work_for_student
    elsif teacher_signed_in?
      set_laboratory_work_for_teacher
    end
  end

  # POST /laboratory_works
  # POST /laboratory    respond_to do |format|
  def create
    if teacher_signed_in?
      create_for_teacher

      respond_to do |format|
        if @laboratory_work.save
          format.html { redirect_to([@laboratory_work.teacher, @laboratory_work], notice: 'Laboratory work was successfully created.') }
        else
          format.html { render :new }
        end
      end
    end
  end

  def create_for_teacher
    group = Group.find(get_group[:group_id])
    group.subgroups.each do |subgroup|
      subgroup.students.each do |student|
        @laboratory_work = current_teacher.laboratory_works.create(get_params_for_teacher.merge({student_id: student.id}))
      end
    end
  end

  # PATCH/PUT /laboratory_works/1
  # PATCH/PUT /laboratory_works/1.json
  def update
    if student_signed_in?
      update_for_student
    elsif teacher_signed_in?
      update_for_teacher
    end
  end

  def update_for_student
    set_laboratory_work_for_student
    respond_to do |format|
      if @laboratory_work.update(get_params_for_student.merge({load_date: Date.today}))
        format.html { redirect_to([@laboratory_work.student, @laboratory_work], :notice => 'Laboratory work was successfully updated.') }
      else
        format.html { render :edit }
      end
    end
  end

  def update_for_teacher
    set_laboratory_work_for_teacher
    respond_to do |format|
      if @laboratory_work.update(get_params_for_teacher)
        format.html { redirect_to([@laboratory_work.teacher, @laboratory_work], :notice => 'Laboratory work was successfully updated.') }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /laboratory_works/1
  # DELETE /laboratory_works/1.json
  def destroy
    set_laboratory_work_for_teacher
    @laboratory_work.destroy
    respond_to do |format|
      format.html { redirect_to teacher_laboratory_works_url, notice: 'Laboratory work was successfully destroyed.' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_laboratory_work_for_teacher
      @laboratory_work = current_teacher.laboratory_works.find(params[:id])
    end

    def set_laboratory_work_for_student
      @laboratory_work = current_student.laboratory_works.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def get_params_for_teacher_create
      params.require(:laboratory_work).permit(:name, :description, :group, :academic_plan_id, :end_date)
    end

    def get_params_for_teacher
      params.require(:laboratory_work).permit(:name, :description, :mark, :academic_plan_id, :end_date)
    end

    def get_group
      params.require(:laboratory_work).permit(:group_id)
    end

    def get_params_for_student
      params.require(:laboratory_work).permit(:document)
    end
end
