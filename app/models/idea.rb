class Idea
  include Mongoid::Document
  include AASM

  field :text, type: String
  field :upvoters, type: Array, default: []
  field :downvoters, type: Array, default: []
  field :aasm_state, type: String

  belongs_to :user
  embeds_many :comments

  validates_presence_of :user
  validates_presence_of :text

  delegate :email, to: :user, prefix: true, allow_nil: true

  aasm do
    state :suggestion, initial: true
    state :project

    event :promote do
      transitions from: :suggestion, to: :project
    end
  end

  def upvote(user)
    downvoters.delete(user.id)
    upvoters.push(user.id) unless upvoters.include? user.id
    self
  end

  def upvote!(user)
    upvote(user)
    save!
  end

  def downvote(user)
    upvoters.delete(user.id)
    downvoters.push(user.id) unless downvoters.include? user.id
    self
  end

  def downvote!(user)
    downvote(user)
    save!
  end

  def cancel_vote(user)
    upvoters.delete(user.id)
    downvoters.delete(user.id)
    self
  end

  def cancel_vote!(user)
    cancel_vote(user)
    save!
  end

  def vote_total
    upvoters.length - downvoters.length
  end
end
