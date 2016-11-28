class Api::UsersController < Api::ApplicationController

  def new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      render json: @user, status: 201
    else
      render json: @user, status: 400
    end
  end

  def show
    @user = User.find(params[:id])
    render json: @user
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

    def user_params
      params.require(:user).permit(:username, :email, :password)
    end

end
