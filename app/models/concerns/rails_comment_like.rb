module RailsCommentLike
  extend ActiveSupport::Concern
  included do
    attribute :liked_count, :integer, default: 0
  end

  def liked?(user_id)
    user_id ? attitudes.liked.exists?(user_id: user_id) : false
  end

  def disliked?(user_id)
    user_id ? attitudes.disliked.exists?(user_id: user_id) : false
  end

end
