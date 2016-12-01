module GroupsHelper
  def invited?
    current_user.invited_groups.include?(params[:id].to_i)
  end

  def grab_user_invite
    invites = current_user.received_invites
    invites.detect { |invite| invite.group_id == @group.id }
  end
end
