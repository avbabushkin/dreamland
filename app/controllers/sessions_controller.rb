class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    
    if user && user.authenticate(params[:session][:password]) 
      log_in user
      redirect_to user
      # login success
      flash.notice = 'Success login'
    else
      # flash.now.alert = "Invalid email/password combination"
        flash.now.notice = 'Invalid email/password combination'
      render :new
    end
  end

  def destroy
    log_out
    redirect_to root_url, notice: 'Logout success'
  end

  private 

end
