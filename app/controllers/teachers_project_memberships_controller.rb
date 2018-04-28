class TeachersProjectMembershipsController < ApplicationController
  before_action :set_teachers_project_membership, only: [:show, :edit, :update, :destroy]

  # GET /teachers_project_memberships
  # GET /teachers_project_memberships.json
  def index
    @teachers_project_memberships = TeachersProjectMembership.all
  end

  # GET /teachers_project_memberships/1
  # GET /teachers_project_memberships/1.json
  def show
  end

  # GET /teachers_project_memberships/new
  def new
    @teachers_project_membership = TeachersProjectMembership.new
  end

  # GET /teachers_project_memberships/1/edit
  def edit
  end

  # POST /teachers_project_memberships
  # POST /teachers_project_memberships.json
  def create
    @teachers_project_membership = TeachersProjectMembership.new(teachers_project_membership_params)

    respond_to do |format|
      if @teachers_project_membership.save
        format.html { redirect_to @teachers_project_membership, notice: 'Teachers project membership was successfully created.' }
        format.json { render :show, status: :created, location: @teachers_project_membership }
      else
        format.html { render :new }
        format.json { render json: @teachers_project_membership.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /teachers_project_memberships/1
  # PATCH/PUT /teachers_project_memberships/1.json
  def update
    respond_to do |format|
      if @teachers_project_membership.update(teachers_project_membership_params)
        format.html { redirect_to @teachers_project_membership, notice: 'Teachers project membership was successfully updated.' }
        format.json { render :show, status: :ok, location: @teachers_project_membership }
      else
        format.html { render :edit }
        format.json { render json: @teachers_project_membership.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /teachers_project_memberships/1
  # DELETE /teachers_project_memberships/1.json
  def destroy
    @teachers_project_membership.destroy
    respond_to do |format|
      format.html { redirect_to teachers_project_memberships_url, notice: 'Teachers project membership was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_teachers_project_membership
      @teachers_project_membership = TeachersProjectMembership.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def teachers_project_membership_params
      params.require(:teachers_project_membership).permit(:teacher_id, :project_id)
    end
end
