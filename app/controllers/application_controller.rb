class ApplicationController < ActionController::Base
  before_action :config_permiyyed_parameters, if: :devise_controller?

  private
  
  def config_permiyyed_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :school_year])
  end
end
