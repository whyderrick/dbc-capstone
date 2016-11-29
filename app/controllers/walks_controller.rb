class WalksController < ApplicationController

  def index
    @walks = current_user.walks
  end

  def new
    current_user
    @walk = Walk.new
  end

  def create
    @walk = Walk.new(walks_params)
    @walk.requester_id = current_user.id

    if @walk.save  
      redirect_to user_walks_path(current_user)
    else
      render '/'
    end

  end

  def show

  end

  def edit
  end

  def update
    @walk = Walk.find(params[:id])
    @walk.guardian_id ||= params[:guardian_id]
    @walk.accepted = true  

    if @walk.save
      @walk.chatroom = Chatroom.create(topic: @walk.id)   
      redirect_to @walk.chatroom
    else
      redirect_back
    end
  end

  def destroy
  end

private

  def walks_params
    params.require(:walk).permit(:starting_location, :walk_time, :destination)
  end

end
