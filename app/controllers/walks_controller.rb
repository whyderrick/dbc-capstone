class WalksController < ApplicationController
  def index
  end

  def new
    current_user
    p @current_user
    @walk = Walk.new
  end

  def create
    @user = User.find_by_id(params[:user_id])
    @walk = Walk.new(walks_params)
    @walk.user = @current_user
    @user.walks << @walk

    if @walk.save
      redirect_to '/groups/index'
    else 
      render '/'
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

  def walks_params
    params.require(:walk).permit(:starting_location, :walk_time, :destination)
  end

end
