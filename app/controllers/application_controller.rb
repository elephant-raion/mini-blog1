class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :basic_auth, if: :production?

  protected
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit :sign_up, 
        keys: [ :email, :name, :password, :password_confirmation ]
      devise_parameter_sanitizer.permit :account_update, 
        keys: [ :email, :name, :profile, :url, :password, :password_confirmation ]
      devise_parameter_sanitizer.permit :sign_in, 
        keys: [ :email, :password]
    end

  private

    def production?
      Rails.env.production?
    end

    def basic_auth
      authenticate_or_request_with_http_basic do |name, password|
        name == ENV['BASIC_AUTH_NAME'] && password == ENV['BASIC_AUTH_PASSWORD']
      end
    end
end