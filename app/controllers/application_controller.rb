class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_locale
  around_action :user_time_zone, if: :current_user

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  private
    def set_locale
      I18n.locale = params[:locale] || I18n.default_locale
    end

    def default_url_options(options={})
      logger.debug "default_url_options is passed options: #{options.inspect}\n"
      {locale: I18n.locale} 
    end
    
    def user_time_zone(&block)
      Time.use_zone(current_user.time_zone, &block)
    end
    
  protected
    def configure_permitted_parameters
      devise_parameter_sanitizer.for(:sign_up) do |u|
        u.permit(:email, :password, :password_confirmation, :terms)
      end
      
      devise_parameter_sanitizer.for(:account_update) do |u|
        u.permit(:first_name, :last_name, :email, :gender, 
        :birthday, :is_tutor, :password, :time_zone,
        :avatar, :remove_avatar, :avatar_cache,
        :password_confirmation, :current_password)
      end
    end
end