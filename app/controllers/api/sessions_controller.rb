class Api::SessionsController < Api::ApplicationController
  skip_before_action :validate_session_key, only: [:create]

  def create
  	@user = User.find_by_email(params[:email])
    is_authed = @user && @user.authenticate(params[:password])

    if is_authed
  		session[:user_id] = @user.id
      session[:session_key] = BCrypt::Password.create(SecureRandom.uuid)
      render json: { user_id: @user.id, session_key: session[:session_key] }
    end

    head :unauthorized if !is_authed
  end

end
