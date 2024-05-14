class ApplicationController < ActionController::Base
    skip_before_action :verify_authenticity_token

    protect_from_forgery with: :exception

    before_action :configure_permitted_parameters, if: :devise_controller?
  
    protected
  
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :password])
    end
  
    # Ensure JSON requests are not checked for CSRF
    def verified_request?
      request.content_type == "application/json" || super
    end
end
