class Api::WalksController < Api::ApplicationController
  before_action :set_all, only: [:index]
  before_action :set_one, only: [:show]
  before_action :validate_session_key

  def index
    render json: @walks
  end

  def show
    render json: @walk
  end

  def create
    walk = Walk.new(walk_params)
    walk.requester_id = current_user.id

    if walk.save
      render json: walk, status: 201
    else
      render json: walk, status: 403
    end
  end

  def update
    head :error
  end

  def destroy
    head :error
  end

  private

  def set_all
    @walks = current_user.walks
  end

  def set_one
    @walk = current_user.walks.where(id: params[:id]).first
  end

  def walk_params
    params.require(:walk).permit(:starting_location, :walk_time, :destination)
  end
end
