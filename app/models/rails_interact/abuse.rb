class Abuse < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :abusement, polymorphic: true

end
