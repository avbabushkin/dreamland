class UsersController < ApplicationController

  before_action :load_user, except: [:new, :create]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save 
      # для отправки писма вызваем метод welcome_email класса UserMailer
      # метод deliver_latter добавляет письмо в очередь
      UserMailer.with(user: @user).welcome_email.deliver_latter
      log_in @user 
      redirect_to @user, success: "Hello, #{@user.email}! Welcome to Dreamland!"
    else
      render :new
    end
  end

  def show
    @dreams = @user.dreams
  end

  def edit
    if @user == current_user
      render :edit
    else
      redirect_to denial_path, danger: "Access denied"
    end 
  end

  def update
    if @user.update(user_params)
      redirect_to @user, success: "Update saccess"
    else
      render :edit
    end
  end

  private 

  def load_user
    @user ||= User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:email, :name, :password, :password_confirmation)
  end
end
