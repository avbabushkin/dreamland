class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @dreams = @user.dreams.order(created_at: :desc)
    
    
    @new_dream = @user.dreams.build
  end

  def new
    @new_user = User.new
  end

  def create
    @new_user = User.new(user_params)
    if @new_user.save
      render 'show'  
    end
  end  

  def destroy
  end

  private

  def user_params
    params.require(:user).permit(:name, :username, :avatar, :password, :password_confirmation)
    
  end
end
