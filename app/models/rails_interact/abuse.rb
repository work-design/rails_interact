class Abuse < ApplicationRecord
  belongs_to :user
  belongs_to :attitudinal, polymorphic: true

end
