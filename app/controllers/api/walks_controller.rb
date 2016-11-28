class Api::WalksController << Api::ApplicationController
  def index
    render json: current_user.walks
  end

  def new
    @walk = Walk.new
  end

  def create
    walk = Walk.new(walk_params)
    walk.requester_id = current_user.id

    if walk.save
      # testing if I need instance variables to render json
      render json: walk, status: 201
    else
      render json: walk, status: 403
    end
  end

  def show
    @walk = Walk.find(:id)
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
    def walk_params
      params.require(:walk).permit(:starting_location, :walk_time, :destination)
    end
end
