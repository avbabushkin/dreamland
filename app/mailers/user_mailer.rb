class UserMailer < ApplicationMailer
  default from: 'no-reply@dreamland.com'

  # method for send mail to new user
  # tempalate of email contain in views/user_mailer/
  def welcome_email
    @user = params[:user]
    @url = 'https://dreamland.herokuapp.com/login'
    mail(to: @user.email, subject: 'Walcome to Dreamland')
  end
end
