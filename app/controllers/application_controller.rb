class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  # helper_method :current_user

  protect_from_forgery with: :exception
  before_filter :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!
  private
def confirm_logged_in
    # unless session[:user_id]
    #   flash[:notice] = "Sessão Inválida."
    #   redirect_to(:controller => 'Access', :action => 'login')
    #   return false
    # else
    #   return true
    # end
end

 protected

 def configure_permitted_parameters
   devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:username,:first_name,:last_name , :email, :password) }
   devise_parameter_sanitizer.for(:sign_in) { |u| u.permit(:email, :password, :remember_me) }
 end

 def current_user
   @current_user = User.find_by(username: 'crystian')
   #@current_user ||= User.find_by_id(session[:user_id])
   #@current_user ||= User.find(session[:user_id]) if session[:user_id]
 end

end
