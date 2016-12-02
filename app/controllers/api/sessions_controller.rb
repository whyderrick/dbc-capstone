class Api::SessionsController < Api::ApplicationController
  before_action :set_user, only: [:create]

  def create
    if is_authed
      setup_session
      render json: { user_id: session[:user_id], session_key: session[:session_key] } and return
    end

    head :unauthorized
  end

  private

  def set_user
  	@user = User.find_by_email(params[:email])
  end

  def is_authed
    @user && @user.authenticate(params[:password])
  end

  def setup_session
		session[:user_id]     = @user.id
    session[:session_key] = BCrypt::Password.create(SecureRandom.uuid)
  end
end
