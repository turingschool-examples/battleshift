require_relative 'boot'

require "rails"
# Pick the frameworks you want:
require "active_model/railtie"
require "active_job/railtie"
require "active_record/railtie"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_view/railtie"
require "action_cable/engine"
require "sprockets/railtie"
# require "rails/test_unit/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module BattleshipWeb
  class Application < Rails::Application
    config.action_mailer.delivery_method = :smtp

    config.action_mailer.smtp_settings = {
      address:              'smtp.sendgrid.net',
      port:                 '587',
      domain:               'example.com',
      user_name:            ENV["SENDGRID_USERNAME"],
      password:             ENV["SENDGRID_PASSWORD"],
      authentication:       'plain',
      enable_starttls_auto: true
    }
    # Do not swallow errors in after_commit/after_rollback callbacks.
    config.active_record.raise_in_transactional_callbacks = true
  end
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.1
    config.before_initialize do |app|
      app.config.paths.add 'app/services/values', :eager_load => true
    end

    config.to_prepare do
      Dir[ File.expand_path(Rails.root.join("app/services/values/*.rb")) ].each do |file|
        require_dependency file
      end
    end
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Don't generate system test files.
    config.generators.system_tests = nil
  end
end
