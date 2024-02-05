module ApplicationHelper
  def nav_link(text, path)
    class_name = current_page?(path) ? 'active' : ''

    content_tag(:div, class: 'menu') do
      link_to(text, path, class: class_name)
    end
  end
end
