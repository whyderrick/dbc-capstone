class UsersController < ApplicationController
  def index
  end

  def new
    @user = User.new
    @token = params[:invite_token]
  end

  def create
    @user = User.new(users_params)
    @token = params[:invite_token]

    if @user.save
      if @token
        register_through_invite
      else
        flash[:notice] = "You have successfully signed up."
        UserMailer.welcome_email(@user).deliver_now
        login
        redirect_to root_path
      end
    else
      @errors = @user.errors.full_messages
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
  end

  def update
  end

  def destroy
  end


private

  def users_params
    params.require(:user).permit(:username, :email, :password)
  end


  def register_through_invite
    source_invite = Invite.find_by_token(@token)
    source_invite.recipient_id = @user.id
    invited_group = source_invite.group

    flash[:notice] = "You have successfully signed up."
    login

    redirect_to invited_group
  end

end
