class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :confiigure_devise_params, if: :devise_controller?
  
  def confiigure_devise_params
    devise_parameter_sanitizer.permit(:sign_up) do |user|
      user.permit(:bio, :username, :name, :email, :password, :password_confirmation)
    end
    devise_parameter_sanitizer.permit(:account_update, keys: [:avatar, :username, :name, :bio])
  end 

  rescue_from CanCan::AccessDenied do |exception|
    respond_to do |format|
      format.json { head :forbidden, content_type: 'text/html' }
      format.html { redirect_to main_app.root_url, notice: exception.message }
      format.js   { head :forbidden, content_type: 'text/html' }
    end
  end
  
end
