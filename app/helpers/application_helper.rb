module ApplicationHelper
  def modal(id, options = {}, &block)
    options[:class] = Array(options[:class]) + ['reveal-modal']
    content_tag :div, options.reverse_merge(id: id) do
      capture(&block) + link_to(raw('&times;'), '#', class: 'close-reveal-modal')
    end
  end
end
