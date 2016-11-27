class Api::UsersController < ApplicationController

  def new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      render json: @user, status: 203
    else
      render json: @user, status: 400
    end
  end

  def show
    @user = User.find(paramd[:id])
    render json: @user
  end

  def edit
  end

  def update
  end

  def destroy
  end

end
