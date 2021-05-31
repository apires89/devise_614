class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  #forcing login or sign up on every route!
  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    # For additional fields in app/views/devise/registrations/new.html.erb
    ### sign up
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username])

    # For additional in app/views/devise/registrations/edit.html.erb
    # change information
    devise_parameter_sanitizer.permit(:account_update, keys: [:username])
  end
end
