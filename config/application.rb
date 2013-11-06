require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(:default, Rails.env)

module Kakuji
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    # config.time_zone = 'Central Time (US & Canada)'

    # Set locales to be made available:
    config.i18n.available_locales = [:en, :ja, :ko] #TODO: 'zh-CN', 'zh-HK', 'zh-TW'

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    config.i18n.load_path += Dir[Rails.root.join('config', 'locales', '**/', '*.{rb,yml}')]
    # config.i18n.default_locale = :de
    
    # Use this for adding custom directories with classes and modules
    config.autoload_paths += %W(#{config.root}/lib)
    
    config.action_mailer.smtp_settings = {
      :address              => "smtp.gmail.com",
      :port                 => 587,
      :domain               => "yourdomain.dev",
      :user_name            => "from@yourdomain.dev",
      :password             => "Super-Secure-Password",
      :authentication       => :plain,
      :enable_starttls_auto => true
    }
    
    config.action_mailer.default_url_options = {
      :host => "yourdomain.dev"
    }
    
    # Configure Devise's layouts on a per-controller basis
    config.to_prepare do
      Devise::SessionsController.layout "simple"
      Devise::PasswordsController.layout "simple"
    end
    
    ActsAsTaggableOn.delimiter = [',', '、'] #Handle Japanese commas
    ActsAsTaggableOn.force_lowercase = true
  end
end
