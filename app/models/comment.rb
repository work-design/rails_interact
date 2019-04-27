class Comment < ApplicationRecord
  include RailsInteract::Comment
end unless defined? Comment
