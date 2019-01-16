module RailsInteractComment
  extend ActiveSupport::Concern
  included do
    attribute :comments_count, :integer, default: 0
  end

  def commentable?(user_id)
    user_id ? !comments.exists?(user_id: user_id) : true
  end

end
