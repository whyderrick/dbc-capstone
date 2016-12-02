class GroupsController < ApplicationController
  def index
    @groups = Group.all
    @group_name = params[:group_title]
    if @group_name
      @groups = Group.search(@group_name)
      p @groups
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
      # Write a new relationship to the membership join table
      # to add the creator as a group member and admin

      Membership.create(group_id: @group, member_id: current_user, admin: true)
      @group.members << current_user
      redirect_to '/groups/index'
    else
      @errors = @group.errors.full_messages
      render :new
    end
  end

  def show
    @group = Group.find(params[:id])
    @invite = Invite.new(group_id: params[:id])
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
