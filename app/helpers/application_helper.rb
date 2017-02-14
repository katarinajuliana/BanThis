module ApplicationHelper
  def nav_link(link_text, link_path)
    class_name = current_page?(link_path) ? 'active' : ''

    content_tag(:li, :class => class_name) do
      link_to link_text, link_path
    end
  end

  def nav_option(link_text, link_path)
    selected = current_page?(link_path)

    content_tag(:option, :selected => selected, value: link_path) do
      link_text
    end
  end
  
  def show_splash_page
    current_page?('/') && 
      (request.referrer.blank? || URI(request.referrer).host != request.domain)
  end
end
