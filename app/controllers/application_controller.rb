class ApplicationController < ActionController::Base
  add_flash_types :danger, :info, :warning, :success

  include SessionsHelper

  def reject_user
    redirect_to denial_path, danger: 'Access denied'    
  end
end
