class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @dreams = @user.dreams.order(created_at: :desc)
    
    
    @new_dream = @user.dreams.build
  end  

  def destroy
  end
end
