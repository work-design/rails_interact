module Interact
  class Comment < ApplicationRecord
    include Model::Comment
    include Model::Like
  end
end
