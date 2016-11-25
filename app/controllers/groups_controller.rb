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
  end

  def create
  end

  def show
  end

  def edit
  end

  def update
  end

  def delete
  end
end
