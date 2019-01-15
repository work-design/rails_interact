require 'closure_tree'
require 'rails_com'
module RailsInteract
  class Engine < ::Rails::Engine

    config.eager_load_paths += Dir[
      "#{config.root}/app/models/rails_interact"
    ]

  end
end
