module Interact
  class Comment < ApplicationRecord
    include Model::Comment
    include Ext::Like
  end
end
