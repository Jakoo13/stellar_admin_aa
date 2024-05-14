module Contractors
  class RegistrationsController < Devise::RegistrationsController
    skip_before_action :verify_authenticity_token
    respond_to :json

    def create
      build_resource(sign_up_params)
      resource.save
      respond_with(resource)
    end

    private

    def sign_up_params
      params.require(:contractor).permit(:email, :password, :first_name, :last_name, :phone_number)
    end

    private

    def respond_with(resource, _opts = {})
      if resource.persisted?
        render json: { message: 'Signed up successfully.', contractor: resource }, status: :ok
      else
        render json: { message: 'Sign up failed.', errors: resource.errors.full_messages }, status: :unprocessable_entity
      end
    end
  end
end
 
  