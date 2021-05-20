module Interact
  module Ext::Like
    extend ActiveSupport::Concern

    included do
      attribute :liked_count, :integer, default: 0
      has_many :attitudes, class_name: 'Interact::Attitude', as: :attitudinal, dependent: :delete_all
    end

    def liked?(user_id)
      user_id ? attitudes.liked.exists?(user_id: user_id) : false
    end

    def disliked?(user_id)
      user_id ? attitudes.disliked.exists?(user_id: user_id) : false
    end

  end
end
