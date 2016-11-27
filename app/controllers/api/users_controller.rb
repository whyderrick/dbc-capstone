class Api::UsersController < ApplicationController

  def show
    render json: User.find(params[:id]).requested_walks
  end
end
