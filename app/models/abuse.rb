class Abuse < ApplicationRecord
  include RailsInteract::Abuse
end unless defined? Abuse
