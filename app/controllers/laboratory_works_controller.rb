class LaboratoryWorksController < ApplicationController
  before_action :set_laboratory_work, only: [:show, :edit, :update, :destroy]

  # GET /laboratory_works
  # GET /laboratory_works.json
  def index
    @laboratory_works = LaboratoryWork.all
  end

  # GET /laboratory_works/1
  # GET /laboratory_works/1.json
  def show
  end

  # GET /laboratory_works/new
  def new
    @laboratory_work = LaboratoryWork.new
  end

  # GET /laboratory_works/1/edit
  def edit
  end

  # POST /laboratory_works
  # POST /laboratory_works.json
  def create
    @laboratory_work = LaboratoryWork.new(laboratory_work_params)

    respond_to do |format|
      if @laboratory_work.save
        format.html { redirect_to @laboratory_work, notice: 'Laboratory work was successfully created.' }
        format.json { render :show, status: :created, location: @laboratory_work }
      else
        format.html { render :new }
        format.json { render json: @laboratory_work.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /laboratory_works/1
  # PATCH/PUT /laboratory_works/1.json
  def update
    respond_to do |format|
      if @laboratory_work.update(laboratory_work_params)
        format.html { redirect_to @laboratory_work, notice: 'Laboratory work was successfully updated.' }
        format.json { render :show, status: :ok, location: @laboratory_work }
      else
        format.html { render :edit }
        format.json { render json: @laboratory_work.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /laboratory_works/1
  # DELETE /laboratory_works/1.json
  def destroy
    @laboratory_work.destroy
    respond_to do |format|
      format.html { redirect_to laboratory_works_url, notice: 'Laboratory work was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_laboratory_work
      @laboratory_work = LaboratoryWork.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def laboratory_work_params
      params.require(:laboratory_work).permit(:name, :description, :mark, :document, :student_id, :teacher_id, :academic_plan_id, :end_date)
    end
end
