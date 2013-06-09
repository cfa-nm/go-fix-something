class Idea
  include Mongoid::Document
  field :text, type: String
  field :upvoters, type: Array, default: []
  field :downvoters, type: Array, default: []
  belongs_to :user
  embeds_many :comments

  delegate :email, to: :user, prefix: true, allow_nil: true

  def upvote(user)
    downvoters.delete(user.id)
    upvoters.push(user.id) unless upvoters.include? user.id
    self
  end

  def downvote(user)
    upvoters.delete(user.id)
    downvoters.push(user.id) unless downvoters.include? user.id
    self
  end

  def cancel_vote(user)
    upvoters.delete(user.id)
    downvoters.delete(user.id)
    self
  end

  def vote_total
    upvoters.length - downvoters.length
  end
end
