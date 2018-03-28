require_relative 'boot'

require "rails"
require "active_model/railtie"
require "active_job/railtie"
require "active_record/railtie"
require "active_storage/engine"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_view/railtie"
require "action_cable/engine"
require "sprockets/railtie"

Bundler.require(*Rails.groups)

module Paps
  class Application < Rails::Application
    config.load_defaults 5.2

    config.generators do |generate|
      generate.helper false
      generate.assets false
      generate.view_specs false
      generate.helper_specs false
      generate.routing_specs false
      generate.controller_specs false
      generate.system_tests false
    end

    config.stripe.secret_key = Rails.application.credentials.stripe[:stripe_secret]
    config.stripe.publishable_key = Rails.application.credentials.stripe[:stripe_app]
    config.stripe.endpoint = '/payment/stripe-integration'
  end
end
