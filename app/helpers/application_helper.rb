module ApplicationHelper
  def flash_messages
    flash.map do |(type, value)|
      content_tag :div, class: ['alert-box', type], data: {alert: true} do
        h(value) + link_to(raw('&times;'), '#', class: 'close')
      end
    end.join.html_safe
  end

  def modal(id, options = {}, &block)
    options[:class] = Array(options[:class]) + ['reveal-modal']
    content_tag :div, options.reverse_merge(id: id) do
      capture(&block) + link_to(raw('&times;'), '#', class: 'close-reveal-modal')
    end
  end
end
