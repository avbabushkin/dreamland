class UsersController < ApplicationController

  before_action :load_user, except: [:new, :create]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save 
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
