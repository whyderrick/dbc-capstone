class GroupsController < ApplicationController
  
  def index
    @groups = Group.all
    @group_title = params[:group_title]
    if @group_title
      @groups = Group.search(@group_title)
      render :index
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
