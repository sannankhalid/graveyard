class CastesController < ApplicationController
  before_action :set_caste, only: [:show, :edit, :update, :destroy]

  # GET /castes
  # GET /castes.json
  def index
    @castes = Caste.all
  end

  # GET /castes/1
  # GET /castes/1.json
  def show
  end

  # GET /castes/new
  def new
    @caste = Caste.new
  end

  # GET /castes/1/edit
  def edit
  end

  # POST /castes
  # POST /castes.json
  def create
    @caste = Caste.new(caste_params)

    respond_to do |format|
      if @caste.save
        format.html { redirect_to @caste, notice: 'Caste was successfully created.' }
        format.json { render :show, status: :created, location: @caste }
      else
        format.html { render :new }
        format.json { render json: @caste.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /castes/1
  # PATCH/PUT /castes/1.json
  def update
    respond_to do |format|
      if @caste.update(caste_params)
        format.html { redirect_to @caste, notice: 'Caste was successfully updated.' }
        format.json { render :show, status: :ok, location: @caste }
      else
        format.html { render :edit }
        format.json { render json: @caste.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /castes/1
  # DELETE /castes/1.json
  def destroy
    @caste.destroy
    respond_to do |format|
      format.html { redirect_to castes_url, notice: 'Caste was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_caste
      @caste = Caste.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def caste_params
      params.require(:caste).permit(:name, :is_active)
    end
end
