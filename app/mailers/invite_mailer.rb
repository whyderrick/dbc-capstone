class InviteMailer < ApplicationMailer

  def invite_new_user(invite)
    @invite = invite
    mail(to: @invite.recipient_email, subject: "You're invited to #{invite.group.name} on Safewalk")
  end

  def invite_existing_user(invite)
    @invite = invite
    mail(to: @invite.recipient_email, subject: "You're invited to #{invite.group.name} on Safewalk")
  end
end
