# frozen_string_literal: true

# SessionaConroller
class SessionsController < ApplicationController
  def new; end

  def create
    user = User.find_by(email: params[:session][:email].downcase)

    if user&.authenticate(params[:session][:password])
      log_in user
      redirect_to user, success: 'Success login'
    else
      redirect_to login_url, danger: 'Invalid email or password'
    end
  end

  def destroy
    log_out
    redirect_to root_url, success: 'Logout success'
  end
end
