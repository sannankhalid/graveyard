class HomeController < ApplicationController
  before_action :form_objects
  add_breadcrumb 'Home', :root_path


  def search

  end

  def graves_data
    graves = Grave.select([:id, :name]).where('LOWER(name) LIKE LOWER(?)', "#{params[:q].to_s.strip}%").order(:name).limit(10).uniq.map { |e| {id: e.id, text: e.name} }

    respond_to do |format|
      format.json {
        render json: graves
      }
      format.html do
      end
    end
  end

  def caste_data
    castes = Caste.select([:id, :name]).where('LOWER(name) LIKE LOWER(?)', "#{params[:q].to_s.strip}%").order(:name).limit(10).uniq.map { |e| {id: e.id, text: e.name} }

    respond_to do |format|
      format.json {
        render json: castes
      }
      format.html do
      end
    end
  end

  def index
    @grave = Grave.new
  end

  private


  def form_objects
    @relationships = Relationship.where(is_active: true)
    @castes = Caste.where(is_active: true).order(:name)
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def grave_params
    params.require(:grave).permit(:name, :relationship_id, :relationship_name, :gender, :caste_id, :died_at, :age, :number, attachment_attributes: [:id, :document])
  end

end

