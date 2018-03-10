class HomeController < ApplicationController
  before_action :form_objects
  add_breadcrumb 'Home', :root_path


  def search

  end

  def search_form

    grave_params = params[:grave]

    options= {sort: "graves.name ASC", conditions: {}, not_conditions: {}}


    options[:conditions].deep_merge!(gender: grave_params[:gender]) if grave_params[:gender].present?
    options[:conditions].deep_merge!(number: grave_params[:number]) if grave_params[:number].present?
    options[:conditions].deep_merge!(number: grave_params[:number]) if grave_params[:number].present?
    options[:conditions].deep_merge!(caste: {caste_id: grave_params[:caste_id]}) if grave_params[:caste_id].present?


    grave = Grave.find grave_params[:id] if grave_params[:id].present?

    options[:raw_conditions]=['LOWER(name) LIKE LOWER(?) || LOWER(relationship_name) LIKE LOWER(?)', "#{grave.name}%", "#{grave.name}%"] if grave.present?

    @graves = Grave.where(options[:conditions]).where(options[:raw_conditions])
                .where.not(options[:not_conditions]).order(options[:sort]).limit(20)

    respond_to do |format|
        format.js {render layout: false}
    end
  end

  def set_conditions_params options


  end


  def graves_data

    graves = Grave.select([:id, :name, :relationship_name, :relationship_id]).where('LOWER(name) LIKE LOWER(?) || LOWER(relationship_name) LIKE LOWER(?)', "#{params[:q].to_s.strip}%", "#{params[:q].to_s.strip}%").order(:name).limit(10).uniq.map { |e|


      name_full = []
      name_full << e.name
      name_full << "#{e.relationship.try(:slug)}  #{e.relationship_name}" if e.relationship.present?
      "#{e.name} #{ }"
      {
        id: e.id,
        text: name_full.join(' ')
      }

    }

    respond_to do |format|
      format.json {
        render json: graves
      }
      format.html do
      end
    end
  end

  def caste_data
    castes = Caste.select([:id, :name]).where(is_active: true).where('LOWER(name) LIKE LOWER(?)', "#{params[:q].to_s.strip}%").order(:name).limit(10).uniq.map { |e| {id: e.id, text: e.name} }

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

