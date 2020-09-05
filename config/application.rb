require_relative 'boot'

require 'rails/all'

Bundler.require(*Rails.groups)

module Meetbook
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2
    config.i18n.default_locale = :ja
    config.time_zone = 'Asia/Tokyo'
    config.active_record.default_timezone = :local
    config.assets.Initialize_on_precompile = false
    config.exceptions_app = self.routes
  end
end
