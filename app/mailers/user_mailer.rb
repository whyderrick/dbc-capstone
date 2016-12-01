class UserMailer < ApplicationMailer
  default from: 'whyderrick@outlook.com'

  def welcome_email(user)
    @user = user
    @url = 'http://safewalk-dbc.herokuapp.com'
    mail(to: @user.email, subject: 'Welcome to Safewalk')
  end
end
