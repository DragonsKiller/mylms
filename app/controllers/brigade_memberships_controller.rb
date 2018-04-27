class BrigadeMembershipsController < ApplicationController
  before_action :set_brigade_membership, only: [:show, :edit, :update, :destroy]

  # GET /brigade_memberships
  # GET /brigade_memberships.json
  def index
    @brigade_memberships = BrigadeMembership.all
  end

  # GET /brigade_memberships/1
  # GET /brigade_memberships/1.json
  def show
  end

  # GET /brigade_memberships/new
  def new
    @brigade_membership = BrigadeMembership.new
  end

  # GET /brigade_memberships/1/edit
  def edit
  end

  # POST /brigade_memberships
  # POST /brigade_memberships.json
  def create
    @brigade_membership = BrigadeMembership.new(brigade_membership_params)

    respond_to do |format|
      if @brigade_membership.save
        format.html { redirect_to @brigade_membership, notice: 'Brigade membership was successfully created.' }
        format.json { render :show, status: :created, location: @brigade_membership }
      else
        format.html { render :new }
        format.json { render json: @brigade_membership.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /brigade_memberships/1
  # PATCH/PUT /brigade_memberships/1.json
  def update
    respond_to do |format|
      if @brigade_membership.update(brigade_membership_params)
        format.html { redirect_to @brigade_membership, notice: 'Brigade membership was successfully updated.' }
        format.json { render :show, status: :ok, location: @brigade_membership }
      else
        format.html { render :edit }
        format.json { render json: @brigade_membership.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /brigade_memberships/1
  # DELETE /brigade_memberships/1.json
  def destroy
    @brigade_membership.destroy
    respond_to do |format|
      format.html { redirect_to brigade_memberships_url, notice: 'Brigade membership was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_brigade_membership
      @brigade_membership = BrigadeMembership.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def brigade_membership_params
      params.require(:brigade_membership).permit(:student_id, :brigade_id)
    end
end
