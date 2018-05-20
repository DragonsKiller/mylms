class LessonsController < ApplicationController
  # GET /lessons
  # GET /lessons.json
  def index

    if teacher_signed_in? && request.original_url.include?("teacher")
      @lessons = current_teacher.lessons

    else
      classes_timetable = ClassesTimetable.find(params[:classes_timetable_id])
      @lessons = classes_timetable.lessons
    end
  end

  # GET /lessons/1
  # GET /lessons/1.json
  def show
    if teacher_signed_in? && request.original_url.include?("teacher")
      set_lesson_for_teacher
    else
      classes_timetable = ClassesTimetable.find(params[:classes_timetable_id])
      @lessons = classes_timetable.lessons.find(params[:id])
    end
  end

  # GET /lessons/new
  def new
    teacher = Teacher.find(params[:teacher_id])
    @lesson = teacher.lessons.build
  end

  # GET /lessons/1/edit
  def edit
    teacher = Teacher.find(params[:teacher_id])
    @lesson = teacher.lessons.find(params[:id])
  end

  # POST /lessons
  # POST /lessons.json
  def create
    teacher = Teacher.find(params[:teacher_id])
    @lesson = teacher.lessons.create(lesson_params)
    respond_to do |format|
      if @lesson.save
        format.html { redirect_to [@lesson.teacher, @lesson], notice: 'Lesson was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /lessons/1
  # PATCH/PUT /lessons/1.json
  def update
    teacher = Teacher.find(params[:teacher_id])
    @lesson = teacher.lessons.find(params[:id])
    respond_to do |format|
      if @lesson.update(lesson_params)
        format.html { redirect_to [@lesson.teacher, @lesson], notice: 'Lesson was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /lessons/1
  # DELETE /lessons/1.json
  def destroy
    teacher = Teacher.find(params[:teacher_id])
    @lesson = teacher.lessons.find(params[:id])
    @lesson.destroy
    respond_to do |format|
      format.html { redirect_to teacher_lessons_url, notice: 'Lesson was successfully destroyed.' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_lesson_for_teacher
      @lesson = current_teacher.lessons.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def lesson_params
      params.require(:lesson).permit(:lesson_type, :lesson_date, :lesson_time, :classes_timetable_id, :subject_id, :teacher_id, :classroom_id)
    end
end
