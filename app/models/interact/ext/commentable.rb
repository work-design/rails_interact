module Interact
  module Ext::Commentable
    extend ActiveSupport::Concern

    included do
      attribute :comments_count, :integer, default: 0

      has_many :comments, class_name: 'Interact::Comment', as: :commentable
    end

    def commentable?(user_id)
      user_id ? !comments.exists?(user_id: user_id) : true
    end

  end
end
