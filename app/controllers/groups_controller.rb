class GroupsController < ApplicationController

  def index
    @groups = Group.all
    @group_name = params[:group_name]
    if @group_name
      @groups = Group.search(@group_name)
      # render :index
    else
      @groups = Group.all
    end
  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(groups_params)

    if @group.save
      redirect_to '/groups/index'
    else
      @errors = @group.errors.full_messages
      render :new
    end
  end

  def show
    @group = Group.find(params[:id])
    @walks = @group.available_walks
  end

  def edit
  end

  def update
  end

  def delete
  end

private

  def groups_params
    params.require(:group).permit(:name, :location)
  end

end
