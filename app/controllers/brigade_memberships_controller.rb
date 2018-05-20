class BrigadeMembershipsController < ApplicationController
  # GET /brigade_memberships
  # GET /brigade_memberships.json
  def index
    brigade = Brigade.find(params[:brigade_id])
    @brigade_memberships = brigade.brigade_memberships
  end

  # GET /brigade_memberships/1
  # GET /brigade_memberships/1.json
  def show
    brigade = Brigade.find(params[:brigade_id])
    @brigade_membership = brigade.brigade_memberships.find(params[:id])
  end

  # GET /brigade_memberships/new
  def new
    brigade = Brigade.find(params[:brigade_id])
    @brigade_membership = brigade.brigade_memberships.build
  end

  # GET /brigade_memberships/1/edit
  def edit
    brigade = Brigade.find(params[:brigade_id])
    @brigade_membership = brigade.brigade_memberships.find(params[:id])
  end

  # POST /brigade_memberships
  # POST /brigade_memberships.json
  def create
    brigade = Brigade.find(params[:brigade_id])
    @brigade_membership = brigade.brigade_memberships.create(brigade_membership_params)

    respond_to do |format|
      if @brigade_membership.save
        format.html { redirect_to brigade_brigade_memberships_url, notice: 'Brigade membership was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /brigade_memberships/1
  # PATCH/PUT /brigade_memberships/1.json
  def update
    brigade = Brigade.find(params[:brigade_id])
    @brigade_membership = brigade.brigade_memberships.find(params[:id])

    respond_to do |format|
      if @brigade_membership.update(brigade_membership_params)
        format.html { redirect_to brigade_brigade_memberships_url, notice: 'Brigade membership was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /brigade_memberships/1
  # DELETE /brigade_memberships/1.json
  def destroy
    brigade = Brigade.find(params[:brigade_id])
    @brigade_membership = brigade.brigade_memberships.find(params[:id])
    @brigade_membership.destroy
    respond_to do |format|
      format.html { redirect_to brigade_brigade_memberships_url, notice: 'Brigade membership was successfully destroyed.' }
    end
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def brigade_membership_params
      params.require(:brigade_membership).permit(:student_id).merge({brigade_id: params[:brigade_id]})
    end
end
