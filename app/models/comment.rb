class Comment < ApplicationRecord
  include RailsInteract::Comment
  include RailsInteract::Like
end unless defined? Comment
