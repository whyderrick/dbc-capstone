class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user, :login, :authorize

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end


  def login
    session[:user_id] = @user.id
  end

  def authorize
    unless current_user
    	flash[:notice] = "Please login to access that information!"
    	redirect_to '/login'
    end
  end

end
