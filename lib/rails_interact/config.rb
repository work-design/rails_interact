require 'active_support/configurable'

module RailsInteract
  include ActiveSupport::Configurable

  configure do |config|
    config.admin_class = 'AdminController'
    config.my_class = 'MyController'
    config.api_class = 'ApiController'
  end

end
