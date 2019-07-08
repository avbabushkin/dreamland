class SessionsController < ApplicationController
  
  def new
  
  end

  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to user, notice: "Залогинились!"
    else
      redirect_to root_url, notice: "Email or password invalid"
      # flash.now[:alert] = "Email or password invalid"
      # render "new"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, notice: "Разлогинились" 
  end
end
