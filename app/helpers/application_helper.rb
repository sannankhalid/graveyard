module ApplicationHelper
  def bootstrap_class_for flash_type
    { success: "alert-success", error: "alert-error", alert: "alert-warning", notice: "alert-info" }[flash_type.to_sym] || flash_type.to_s
  end

  def flash_messages(opts = {})
    flash.each do |msg_type, message|
      concat(content_tag(:div, message, class: "alert #{bootstrap_class_for(msg_type)} alert-dismissible fade show", role: 'alert') do
        concat(content_tag(:button, class: 'close', data: { dismiss: 'alert' }, 'aria-label' => "Close" ) do
          concat content_tag(:span, '&times;'.html_safe, 'aria-hidden' => true)
        end)
        case
          when bootstrap_class_for(msg_type) == "alert-success"
            concat content_tag(:span, '<i class="fa fa-check-circle"></i>'.html_safe, 'aria-hidden' => true)
          when bootstrap_class_for(msg_type) == ("alert-danger" || "alert-warning")
            concat content_tag(:span, '<i class="fa fa-times-circle"></i>'.html_safe, 'aria-hidden' => true)
          else
            concat content_tag(:span, '<i class="fa fa-info-circle"></i>'.html_safe, 'aria-hidden' => true)
        end
        concat " " + message
        concat "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;".html_safe
      end)
    end
    nil
  end
  def get_sort_class sortby
    return "sorting_desc" if params[:sort].to_s.include?("#{sortby} desc")
    return "sorting_asc" if params[:sort].to_s.include?("#{sortby} asc")
  end

  def get_direction_class column_name
    return "sorting_desc" if params[:direction].to_s.include?("desc")&& params[:sort].include?("#{column_name}")
    return "sorting_asc" if params[:direction].to_s.include?("asc") && params[:sort].include?("#{column_name}")
  end
  def link_to_sort name,sortby , **options
    sortby << (params[:sort].to_s.include?("#{sortby} asc") ? " desc" : " asc")
    link_to(name ,url_for(params.merge(sort: sortby)),options)
  end
end
