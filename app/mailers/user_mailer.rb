class UserMailer < ApplicationMailer
  default from: 'no-reply@dreamland.com'

  # метод для отправки почты новому пользователю
  # шаблон писма лежит в views/user_mailer/
  def welcome_email
    @user = params[:user]
    @url = 'http://example.com/login'
    mail(to: @user.email, subject: 'Walcome to Dreamland')
  end
end
