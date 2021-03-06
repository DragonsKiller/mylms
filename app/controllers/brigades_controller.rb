class BrigadesController < ApplicationController
  before_action :set_brigade, only: [:show, :edit, :update, :destroy]

  # GET /brigades
  # GET /brigades.json
  def index
    @brigades = current_student.brigades
  end

  # GET /brigades/1
  # GET /brigades/1.json
  def show
  end

  # GET /brigades/new
  def new
    @brigade = Brigade.new
  end

  # GET /brigades/1/edit
  def edit
  end

  # POST /brigades
  # POST /brigades.json
  def create
    @brigade = Brigade.new(brigade_params.merge(brigade_admin_id: current_student.id))

    respond_to do |format|
      if @brigade.save
        @brigade_membership = @brigade.brigade_memberships.create({brigade_id: @brigade.id, student_id: current_student.id})
        if @brigade_membership.save
          format.html { redirect_to  @brigade, notice: 'Brigade was successfully created.' }
        else
          format.html { render :new }
        end
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /brigades/1
  # PATCH/PUT /brigades/1.json
  def update
    respond_to do |format|
      if @brigade.update(brigade_params)
        format.html { redirect_to @brigade, notice: 'Brigade was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /brigades/1
  # DELETE /brigades/1.json
  def destroy
    @brigade.destroy
    respond_to do |format|
      format.html { redirect_to brigades_url, notice: 'Brigade was successfully destroyed.' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_brigade
      @brigade = Brigade.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def brigade_params
      params.require(:brigade).permit(:name)
    end
end
