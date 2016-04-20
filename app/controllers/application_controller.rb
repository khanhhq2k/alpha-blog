class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user, :logged_in?
  
  def current_user
    #if @current_user is not defined yet then it is equal to User....
    #Else, leave it alone(no action to DB)
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  
  def logged_in?
    #turn current_user method result to boolean, either true/false
    !!current_user
  end
  
  def require_user
    if !logged_in?
      flash[:danger] = "Please log in to process!"
      redirect_to root_path
    end
  end
end
