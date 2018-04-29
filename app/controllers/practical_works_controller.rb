class PracticalWorksController < ApplicationController
  before_action :set_practical_work, only: [:show, :edit, :update, :destroy]

  # GET /practical_works
  # GET /practical_works.json
  def index
    @practical_works = PracticalWork.all
  end

  # GET /practical_works/1
  # GET /practical_works/1.json
  def show
  end

  # GET /practical_works/new
  def new
    @practical_work = PracticalWork.new
  end

  # GET /practical_works/1/edit
  def edit
  end

  # POST /practical_works
  # POST /practical_works.json
  def create
    @practical_work = PracticalWork.new(practical_work_params)

    respond_to do |format|
      if @practical_work.save
        format.html { redirect_to @practical_work, notice: 'Practical work was successfully created.' }
        format.json { render :show, status: :created, location: @practical_work }
      else
        format.html { render :new }
        format.json { render json: @practical_work.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /practical_works/1
  # PATCH/PUT /practical_works/1.json
  def update
    respond_to do |format|
      if @practical_work.update(practical_work_params)
        format.html { redirect_to @practical_work, notice: 'Practical work was successfully updated.' }
        format.json { render :show, status: :ok, location: @practical_work }
      else
        format.html { render :edit }
        format.json { render json: @practical_work.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /practical_works/1
  # DELETE /practical_works/1.json
  def destroy
    @practical_work.destroy
    respond_to do |format|
      format.html { redirect_to practical_works_url, notice: 'Practical work was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_practical_work
      @practical_work = PracticalWork.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def practical_work_params
      params.require(:practical_work).permit(:name, :description, :mark, :document, :student_id, :teacher_id, :academic_plan_id, :end_date)
    end
end
