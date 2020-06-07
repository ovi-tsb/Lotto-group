require_relative 'boot'

require 'rails/all'
require 'fog/core'
Fog::Logger[:deprecation] = nil


# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module LottoGroup
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2

    config.autoload_paths << Rails.root.join("lib")
    
    config.time_zone = 'Eastern Time (US & Canada)'
    config.active_record.default_timezone = :local 

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
  end
end
