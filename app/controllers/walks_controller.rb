class WalksController < ApplicationController
  def index
  end

  def new
    @walk = Walk.new
  end

  def create
    @group = Group.find(params[:id])
    @walk = Walk.new(walks_params)

    if @walk.save
      redirect_to '/groups/index'
    else 
      @errors = @group.errors.full_messages
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

  def walks_params
    params.require(:walk).permit(:starting_location, :walk_time, :destination)
  end

end
