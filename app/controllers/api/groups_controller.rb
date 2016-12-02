class Api::GroupsController < Api::ApplicationController
  before_action :set_all, only: [:index]
  before_action :set_one, only: [:show, :update, :destroy]
  before_action :set_user, if: :is_user_request?, only: [:show]
  before_action :validate_session_key, only: [:create]
  before_action :validate_session_key, if: :is_user_request?, only: [:show]

  def index
    render json: @groups
  end

  def show
    render json: @groups.first
  end

  def update
    # update @group
    head :error
  end

  def destroy
    # destroy group
    head :error
  end

  def create
    group = Group.new(group_params)

    if group.save
      current_user.groups << group

      render json: group, status: 201
    else
      render json: group, status: 403
    end
  end

  private

  def set_all
    @groups = Group.all
  end

  def set_one
    @groups = Group.where(params[:id])
  end

  def set_user
    @groups.where(user_id: current_user.id) if @groups
  end

  def group_params
    params.require(:group).permit(:name, :location, :description)
  end

  def is_user_request?
    params[:user_id]
  end
end
