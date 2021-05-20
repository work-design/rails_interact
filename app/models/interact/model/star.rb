module Interact
  module Model::Star
    extend ActiveSupport::Concern

    included do
      belongs_to :starred, polymorphic: true
      belongs_to :user

      validates :user_id, uniqueness: { scope: [:starred_type, :starred_id] }
    end

  end
end
