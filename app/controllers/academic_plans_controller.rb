class AcademicPlansController < ApplicationController
  before_action :set_academic_plan, only: [:show, :edit, :update, :destroy]

  # GET /academic_plans
  # GET /academic_plans.json
  def index
    @academic_plans = AcademicPlan.all
  end

  # GET /academic_plans/1
  # GET /academic_plans/1.json
  def show
  end

  # GET /academic_plans/new
  def new
    @academic_plan = AcademicPlan.new
  end

  # GET /academic_plans/1/edit
  def edit
  end

  # POST /academic_plans
  # POST /academic_plans.json
  def create
    @academic_plan = AcademicPlan.new(academic_plan_params)

    respond_to do |format|
      if @academic_plan.save
        format.html { redirect_to @academic_plan, notice: 'Academic plan was successfully created.' }
        format.json { render :show, status: :created, location: @academic_plan }
      else
        format.html { render :new }
        format.json { render json: @academic_plan.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /academic_plans/1
  # PATCH/PUT /academic_plans/1.json
  def update
    respond_to do |format|
      if @academic_plan.update(academic_plan_params)
        format.html { redirect_to @academic_plan, notice: 'Academic plan was successfully updated.' }
        format.json { render :show, status: :ok, location: @academic_plan }
      else
        format.html { render :edit }
        format.json { render json: @academic_plan.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /academic_plans/1
  # DELETE /academic_plans/1.json
  def destroy
    @academic_plan.destroy
    respond_to do |format|
      format.html { redirect_to academic_plans_url, notice: 'Academic plan was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_academic_plan
      @academic_plan = AcademicPlan.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def academic_plan_params
      params.require(:academic_plan).permit(:semester_id, :subject_id)
    end
end
