# Preview all emails at http://localhost:3000/rails/mailers/invite_mailer
class InviteMailerPreview < ActionMailer::Preview
  def invite_new_user_preview
    InviteMailer.invite_new_user(Invite.first)
  end

  def invite_existing_user_preview
    InviteMailer.invite_existing_user(Invite.first)
  end
end
