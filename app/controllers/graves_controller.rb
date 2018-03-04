class GravesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_grave, only: [:show, :edit, :update, :destroy]
  before_action :form_objects
  add_breadcrumb 'Home',:root_path


  # GET /graves
  # GET /graves.json
  def index
    add_breadcrumb 'Graves'
    @graves = Grave.all
  end

  # GET /graves/1
  # GET /graves/1.json
  def show
  end

  # GET /graves/new
  def new
    add_breadcrumb 'Graves',:graves_path
    add_breadcrumb 'New'

    @grave = Grave.new
    @grave.build_attachment
  end

  # GET /graves/1/edit
  def edit
    add_breadcrumb 'Graves',:graves_path
    add_breadcrumb 'Edit'
  end

  # POST /graves
  # POST /graves.json
  def create
    @grave = Grave.new(grave_params)
    @grave.created_by_id = current_user.id
    @grave.updated_by_id = current_user.id

    if @grave.attachment.present?
      @grave.attachment.created_by_id = current_user.id
      @grave.attachment.updated_by_id = current_user.id
    end
    respond_to do |format|
      if @grave.save
        format.html { redirect_to graves_url, notice: 'Grave was successfully created.' }
        format.json { render :show, status: :created, location: @grave }
      else
        @grave.build_attachment
        format.html { render :new }
        format.json { render json: @grave.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /graves/1
  # PATCH/PUT /graves/1.json
  def update
    @grave.updated_by_id = current_user.id
    respond_to do |format|
      if @grave.update(grave_params)
        format.html { redirect_to graves_url, notice: 'Grave was successfully updated.' }
        format.json { render :show, status: :ok, location: @grave }
      else
        format.html { render :edit }
        format.json { render json: @grave.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /graves/1
  # DELETE /graves/1.json
  def destroy
    @grave.destroy
    respond_to do |format|
      format.html { redirect_to graves_url, notice: 'Grave was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_grave
      @grave = Grave.find(params[:id])
    end

    def form_objects
      @relationships  = Relationship.where(is_active:  true)
      @castes  = Caste.where(is_active:  true).order(:name)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def grave_params
      params.require(:grave).permit(:name, :relationship_id, :relationship_name, :gender, :caste_id, :died_at, :age, :number, attachment_attributes: [:id, :document])
    end
end
