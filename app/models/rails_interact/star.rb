class Star < ApplicationRecord
  belongs_to :starred, polymorphic: true
  belongs_to :user

  validates :user_id, uniqueness: { scope: [:starred_type, :starred_id] }

end
