class ConspectsController < ApplicationController
  before_action :set_conspect, only: [:show, :edit, :update, :destroy]

  # GET /conspects
  # GET /conspects.json
  def index
    @conspects = Conspect.all
  end

  # GET /conspects/1
  # GET /conspects/1.json
  def show
  end

  # GET /conspects/new
  def new
    @conspect = Conspect.new
  end

  # GET /conspects/1/edit
  def edit
  end

  # POST /conspects
  # POST /conspects.json
  def create
    @conspect = Conspect.new(conspect_params)

    respond_to do |format|
      if @conspect.save
        format.html { redirect_to @conspect, notice: 'Conspect was successfully created.' }
        format.json { render :show, status: :created, location: @conspect }
      else
        format.html { render :new }
        format.json { render json: @conspect.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /conspects/1
  # PATCH/PUT /conspects/1.json
  def update
    respond_to do |format|
      if @conspect.update(conspect_params)
        format.html { redirect_to @conspect, notice: 'Conspect was successfully updated.' }
        format.json { render :show, status: :ok, location: @conspect }
      else
        format.html { render :edit }
        format.json { render json: @conspect.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /conspects/1
  # DELETE /conspects/1.json
  def destroy
    @conspect.destroy
    respond_to do |format|
      format.html { redirect_to conspects_url, notice: 'Conspect was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_conspect
      @conspect = Conspect.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def conspect_params
      params.require(:conspect).permit(:title, :description, :speciality_number, :content, :user_id)
    end
end
