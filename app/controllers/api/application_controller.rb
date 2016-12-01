class Api::ApplicationController < ActionController::Base
  helper_method :current_user, :login, :authorize
  before_action :validate_session_key

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

  private

  # For XSS
  def validate_session_key
    head :unauthorized if session[:session_key].nil?
    head :unauthorized if request.headers["HTTP_X_SESSION_KEY"].nil?
    head :unauthorized if request.headers["HTTP_X_SESSION_KEY"] =! session[:session_key]
  end

end
