require 'active_support/configurable'

module RailsComment
  include ActiveSupport::Configurable

  configure do |config|
    config.admin_class = 'AdminController'
    config.my_class = 'MyController'
    config.api_class = 'ApiController'
    config.disabled_models = []
  end

end