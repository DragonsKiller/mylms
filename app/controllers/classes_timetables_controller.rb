class ClassesTimetablesController < ApplicationController
  before_action :set_classes_timetable, only: [:show, :edit, :update, :destroy]

  # GET /classes_timetables
  # GET /classes_timetables.json
  def index
    @classes_timetables = ClassesTimetable.all
  end

  # GET /classes_timetables/1
  # GET /classes_timetables/1.json
  def show
  end

  # GET /classes_timetables/new
  def new
    @classes_timetable = ClassesTimetable.new
  end

  # GET /classes_timetables/1/edit
  def edit
  end

  # POST /classes_timetables
  # POST /classes_timetables.json
  def create
    @classes_timetable = ClassesTimetable.new(classes_timetable_params)

    respond_to do |format|
      if @classes_timetable.save
        format.html { redirect_to @classes_timetable, notice: 'Classes timetable was successfully created.' }
        format.json { render :show, status: :created, location: @classes_timetable }
      else
        format.html { render :new }
        format.json { render json: @classes_timetable.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /classes_timetables/1
  # PATCH/PUT /classes_timetables/1.json
  def update
    respond_to do |format|
      if @classes_timetable.update(classes_timetable_params)
        format.html { redirect_to @classes_timetable, notice: 'Classes timetable was successfully updated.' }
        format.json { render :show, status: :ok, location: @classes_timetable }
      else
        format.html { render :edit }
        format.json { render json: @classes_timetable.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /classes_timetables/1
  # DELETE /classes_timetables/1.json
  def destroy
    @classes_timetable.destroy
    respond_to do |format|
      format.html { redirect_to classes_timetables_url, notice: 'Classes timetable was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_classes_timetable
      @classes_timetable = ClassesTimetable.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def classes_timetable_params
      params.require(:classes_timetable).permit(:semester_id, :subgroup_id)
    end
end
