class ApplicationController < ActionController::Base
  add_flash_types :danger, :info, :warring, :success

  include SessionsHelper

  def reject_user
    redirect_to root_url, danger: 'Access denied'    
  end
end