class SubgroupsController < ApplicationController
  # GET /subgroups
  # GET /subgroups.json
  def index
   group = Group.find(params[:group_id])
   @subgroups = group.subgroups
  end

  # GET /subgroups/1
  # GET /subgroups/1.json
  def show
    group = Group.find(params[:group_id])

    @subgroup = group.subgroups.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb

      format.xml  { render :xml => @subgroup }
    end
  end

  # GET /subgroups/new
  def new
    group = Group.find(params[:group_id])
    @subgroup = group.subgroups.build

    respond_to do |format|
      format.html # new.html.erb

      format.xml  { render :xml => @subgroup }
    end
  end

  # GET /subgroups/1/edit
  def edit
    group = Group.find(params[:group_id])

    @subgroup = group.subgroups.find(params[:id])
  end

  # POST /subgroups
  # POST /subgroups.json
  def create
    group = Group.find(params[:group_id])

    @subgroup = group.subgroups.create(subgroup_params)

    respond_to do |format|
      if @subgroup.save
        format.html { redirect_to([@subgroup.group, @subgroup], :notice => 'Comment was successfully created.') }
        format.xml  { render :xml => @subgroup, :status => :created, :location => [@subgroup.group, @subgroup] }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @subgroup.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /subgroups/1
  # PATCH/PUT /subgroups/1.json
  def update
    group = Group.find(params[:group_id])

    @subgroup = group.subgroups.find(params[:id])
    respond_to do |format|
      if @subgroup.update(subgroup_params)
        format.html { redirect_to([@subgroup.group, @subgroup], :notice => 'Comment was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @subgroup.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /subgroups/1
  # DELETE /subgroups/1.json
  def destroy
    group = Group.find(params[:group_id])

    @subgroup = group.subgroups.find(params[:id])
    @subgroup.destroy

    respond_to do |format|
      format.html { redirect_to(group_subgroups_url) }
      format.xml  { head :ok }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_subgroup
      @subgroup = Subgroup.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def subgroup_params
      params.require(:subgroup).permit(:name, :group_id)
    end
end
