class PracticalWorksController < ApplicationController

  # GET /practical_works
  # GET /practical_works.json
  def index
    if student_signed_in?
      @practical_works = current_student.practical_works
    elsif teacher_signed_in?
      @practical_works = current_teacher.practical_works
    end
  end

  # GET /practical_works/1
  # GET /practical_works/1.json
  def show
    if student_signed_in?
      set_practical_work_for_student
    elsif teacher_signed_in?
      set_practical_work_for_teacher
    end
  end

  # GET /practical_works/new
  def new
    if student_signed_in?
      @practical_work = current_student.practical_works.build
    elsif teacher_signed_in?
      @practical_work = current_teacher.practical_works.build
    end
  end

  # GET /practical_works/1/edit
  def edit
    if student_signed_in?
      set_practical_work_for_student
    elsif teacher_signed_in?
      set_practical_work_for_teacher
    end
  end

  # POST /practical_works
  # POST /practical_works.json
  def create
    if teacher_signed_in?
      create_for_teacher
    end

    respond_to do |format|
      if @practical_work.save
        format.html { redirect_to teacher_practical_works_url, notice: 'Laboratory work was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def create_for_teacher
    group = Group.find(get_group[:group_id])
    group.subgroups.each do |subgroup|
      subgroup.students.each do |student|
        @practical_work = current_teacher.practical_works.create(get_params_for_teacher.merge({student_id: student.id}))
      end
    end
  end

  # PATCH/PUT /practical_works/1
  # PATCH/PUT /practical_works/1.json
  def update
    if student_signed_in?
      update_for_student
    elsif teacher_signed_in?
      update_for_teacher
    end
  end

  def update_for_student
    set_practical_work_for_student
    respond_to do |format|
      if @practical_work.update(get_params_for_student.merge({load_date: Date.today}))
        format.html { redirect_to([@practical_work.student, @practical_work], :notice => 'Laboratory work was successfully updated.') }
      else
        format.html { render :edit }
      end
    end
  end

  def update_for_teacher
    set_practical_work_for_teacher
    respond_to do |format|
      if @practical_work.update(get_params_for_teacher)
        format.html { redirect_to([@practical_work.teacher, @practical_work], :notice => 'Laboratory work was successfully updated.') }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /practical_works/1
  # DELETE /practical_works/1.json
  def destroy
    set_practical_work_for_teacher
    @practical_work.destroy
    respond_to do |format|
      format.html { redirect_to teacher_practical_works_url, notice: 'Laboratory work was successfully destroyed.' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_practical_work_for_teacher
      @practical_work = current_teacher.practical_works.find(params[:id])
    end

    def set_practical_work_for_student
      @practical_work = current_student.practical_works.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def get_params_for_teacher_create
      params.require(:practical_work).permit(:name, :description, :group, :academic_plan_id, :end_date)
    end

    def get_params_for_teacher
      params.require(:practical_work).permit(:name, :description, :mark, :academic_plan_id, :end_date)
    end

    def get_group
      params.require(:practical_work).permit(:group_id)
    end

    def get_params_for_student
      params.require(:practical_work).permit(:document)
    end
end
