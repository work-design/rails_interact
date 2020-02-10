module RailsInteract::Abuse
  extend ActiveSupport::Concern
  included do
    attribute :note, :string

    belongs_to :user, optional: true
    belongs_to :abusement, polymorphic: true
  end

end
