class UsersController < ApplicationController

  #before_action :load_user, except: [:index, :new, :create]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save 
      log_in @user 
      redirect_to @user, notice: "Hello, #{@user.name}"
    else
      render 'new'
    end
  end

  def show
    load_user
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to @user, notice: "Up to date saccess"
    else
      render 'edit'
    end
  end

  def destroy
    user = load_user    
  end

  private 

  def load_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:email, :name, :password, :password_confirmation)
  end

end
