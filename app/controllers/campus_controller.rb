class CampusController < ApplicationController
  before_action :set_campus, only: [:show, :edit, :update, :destroy]

  # GET /campuss
  # GET /campuss.json
  def index
    @campus = Campus.all
  end

  # GET /campuss/1
  # GET /campuss/1.json
  def show
  end

  # GET /campuss/new
  def new
    @campus = Campus.new
  end

  # GET /campuss/1/edit
  def edit
  end

  # POST /campuss
  # POST /campuss.json
  def create
    @campus = Campus.new(campus_params)

    respond_to do |format|
      if @campus.save
        format.html { redirect_to @campus, notice: 'Campus was successfully created.' }
        format.json { render :show, status: :created, location: @campus }
      else
        format.html { render :new }
        format.json { render json: @campus.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /campuss/1
  # PATCH/PUT /campuss/1.json
  def update
    respond_to do |format|
      if @campus.update(campus_params)
        format.html { redirect_to @campus, notice: 'Campus was successfully updated.' }
        format.json { render :show, status: :ok, location: @campus }
      else
        format.html { render :edit }
        format.json { render json: @campus.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /campuss/1
  # DELETE /campuss/1.json
  def destroy
    @campus.destroy
    respond_to do |format|
      format.html { redirect_to campuss_index_url, notice: 'Campus was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_campus
      @campus = Campus.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def campus_params
      params.fetch(:campus, {})
    end
end
