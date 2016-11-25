class UsersController < ApplicationController
  def index
  end

  def new
    @user = User.new
  end

  def create
   @user = User.new(users_params)
    if @user.save
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

  def delete
  end

  
private

  def users_params
    params.require(:user).permit(:username, :email, :password)
  end

end
