# frozen_string_literal: true

# UsersConroller
class UsersController < ApplicationController
  before_action :load_user, except: %i[new create]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      # for send email to user use method welcome_email
      # welcome_email is method of class UserMailer
      # method deliver_latter adding email to queue
      UserMailer.with(user: @user).welcome_email.deliver_now
      log_in @user
      redirect_to @user, success: "Hello, #{@user.email}! Welcome to Dreamland!"
    else
      render :new
    end
  end

  def show
    @dreams = @load_user.dreams
  end

  def edit
    if @load_user == current_user
      render :edit
    else
      redirect_to denial_path, danger: 'Access denied'
    end
  end

  def update
    if @load_user.update(user_params)
      redirect_to @user, success: 'Update success'
    else
      render :edit
    end
  end

  private

  def load_user  
    if user_present?
      @load_user = User.find(params[:id])
    else
      reject_user
    end
  end

  def user_present?
    User.find_by(id: params[:id]).present?
  end

  def user_params
    params.require(:user)
          .permit(:email, :name, :password, :password_confirmation)
  end
end
