module RailsInteract::Abuse
  extend ActiveSupport::Concern
  included do
    belongs_to :user, optional: true
    belongs_to :abusement, polymorphic: true
  end
  
end
