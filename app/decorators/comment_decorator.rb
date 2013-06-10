class CommentDecorator < Draper::Decorator
  delegate_all

  def html
    h.auto_link(h.simple_format(object.text))
  end
end
