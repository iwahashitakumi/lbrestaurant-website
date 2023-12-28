module ApplicationHelper
  def show_error_messages(object, attribute)
    if object.errors.full_messages_for(attribute).any?
      content_tag(:div, class: "text-danger") do
        content_tag(:ul, class: "mb-0") do
          object.errors.full_messages_for(attribute).map do |message|
            content_tag(:li, message)
          end.join.html_safe
        end
      end
    end
  end

  def format_datetime(datetime)
    datetime.strftime("%Y/ %m/ %d /%H:%M")
  end

  def format_date(date)
    date.strftime("%Y/ %m/ %d")
  end
end
