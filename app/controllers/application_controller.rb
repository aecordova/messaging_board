# frozen_string_literal: true

# Application Controller
class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username])
  end

  private

  def error_messages(resource)
    messages = resource.errors.full_messages

    "Can't save because #{messages.length == 1 ? messages.first : messages.join(' and ')}"
  end
end
