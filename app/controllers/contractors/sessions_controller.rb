module Contractors
  class SessionsController < Devise::SessionsController
    skip_before_action :verify_authenticity_token
    respond_to :json

    private

    def respond_with(resource, _opts = {})
      render json: { contractor: resource}, except: [:created_at, :updated_at]
    end

    def respond_to_on_destroy
      render json: { message: "Logout Success" }
    end

    def current_token
      request.env['warden-jwt_auth.token']
    end
  end
end