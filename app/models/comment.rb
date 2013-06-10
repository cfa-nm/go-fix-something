class Comment
  include Mongoid::Document
  field :text, type: String
  field :author_id, type: Moped::BSON::ObjectId
  embedded_in :idea

  delegate :email, to: :author, prefix: true, allow_nil: true

  def author
    User.find(author_id) if author_id
  end

  def author=(user)
    self.author_id = user.try(:id)
  end
end
