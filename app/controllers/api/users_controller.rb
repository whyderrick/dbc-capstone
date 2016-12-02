class Api::UsersController < Api::ApplicationController
  before_action :set_one, only: [:show]

  def create
    @user = User.new(user_params)

    if @user.save
      render json: @user, status: 201
    else
      render json: @user, status: 400
    end
  end

  def show
    render json: @user
  end

  def update
    head :error
  end

  def destroy
    head :error
  end

  private

  def set_one
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end

end
