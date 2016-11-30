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
        invited_group = Invite.find_by_token(@token).group
        users.groups << invited_group
      end
      flash[:notice] = "You have successfully signed up."
      login
      redirect_to root_path
    else
      @errors = @user.errors.full_messages
      render :new
    end
  end

  def show
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

end
