require 'closure_tree'
require 'rails_com'
module RailsInteract
  class Engine < ::Rails::Engine
    
    config.generators do |g|
      g.rails = {
        assets: false,
        stylesheets: false,
        helper: false
      }
      g.test_unit = {
        fixture: true,
        fixture_replacement: :factory_bot
      }
      g.templates.unshift File.expand_path('lib/templates', RailsCom::Engine.root)
    end

  end
end
