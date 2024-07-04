# frozen_string_literal: true

# /app/helpers/application_helper.rb
module ApplicationHelper
  def error_messages_for(object)
    render(partial: 'layouts/error_messages', locals: { object: object })
  end

  def status_tag(boolean)
    if boolean
      content_tag(:span, '', class: 'status true')
    else
      content_tag(:span, '', class: 'status false')
    end
  end
end
