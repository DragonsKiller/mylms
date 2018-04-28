class StudentsProjectMembershipsController < ApplicationController
  before_action :set_students_project_membership, only: [:show, :edit, :update, :destroy]

  # GET /students_project_memberships
  # GET /students_project_memberships.json
  def index
    @students_project_memberships = StudentsProjectMembership.all
  end

  # GET /students_project_memberships/1
  # GET /students_project_memberships/1.json
  def show
  end

  # GET /students_project_memberships/new
  def new
    @students_project_membership = StudentsProjectMembership.new
  end

  # GET /students_project_memberships/1/edit
  def edit
  end

  # POST /students_project_memberships
  # POST /students_project_memberships.json
  def create
    @students_project_membership = StudentsProjectMembership.new(students_project_membership_params)

    respond_to do |format|
      if @students_project_membership.save
        format.html { redirect_to @students_project_membership, notice: 'Students project membership was successfully created.' }
        format.json { render :show, status: :created, location: @students_project_membership }
      else
        format.html { render :new }
        format.json { render json: @students_project_membership.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /students_project_memberships/1
  # PATCH/PUT /students_project_memberships/1.json
  def update
    respond_to do |format|
      if @students_project_membership.update(students_project_membership_params)
        format.html { redirect_to @students_project_membership, notice: 'Students project membership was successfully updated.' }
        format.json { render :show, status: :ok, location: @students_project_membership }
      else
        format.html { render :edit }
        format.json { render json: @students_project_membership.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /students_project_memberships/1
  # DELETE /students_project_memberships/1.json
  def destroy
    @students_project_membership.destroy
    respond_to do |format|
      format.html { redirect_to students_project_memberships_url, notice: 'Students project membership was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_students_project_membership
      @students_project_membership = StudentsProjectMembership.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def students_project_membership_params
      params.require(:students_project_membership).permit(:student_id, :project_id)
    end
end
