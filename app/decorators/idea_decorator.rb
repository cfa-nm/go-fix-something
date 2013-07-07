class IdeaDecorator < Draper::Decorator
  delegate_all
  decorates_association :comments

  def html
    h.auto_link(h.simple_format(object.text))
  end

  def owned_by?(user)
    user && object.user && (object.user.id == user.id)
  end

  def owned_by_current_user?
    owned_by? h.current_user
  end

  def can_vote?
    h.user_signed_in? && (object.user != h.current_user)
  end

  def can_upvote?
    can_vote? && !is_upvoter
  end

  def can_downvote?
    can_vote? && !is_downvoter
  end

  def can_cancel_vote?
    can_vote? && (is_upvoter || is_downvoter)
  end

  private

  def is_upvoter
    object.upvoters.include?(h.current_user.try(:id))
  end

  def is_downvoter
    object.downvoters.include?(h.current_user.try(:id))
  end
end
