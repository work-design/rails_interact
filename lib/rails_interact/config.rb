require 'active_support/configurable'

module RailsInteract
  include ActiveSupport::Configurable

  configure do |config|
    config.admin_controller = 'AdminController'
    config.my_controller = 'MyController'
  end

end
