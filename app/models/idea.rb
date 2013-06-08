class Idea
  include Mongoid::Document
  field :text, type: String
  belongs_to :user

  delegate :email, to: :user, prefix: true
end
