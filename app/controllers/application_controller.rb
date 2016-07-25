class ApplicationController < ActionController::Base
  include Pundit
  protect_from_forgery with: :exception
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  
  def after_sign_in_path_for(resource)
    rooms_path  
  end

  private
  
  def user_not_authorized
    flash[:alert] = "Nie masz uprawnień do wyświetlania tej strony"
    redirect_to root_path
  end
end
