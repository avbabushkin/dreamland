class ApplicationController < ActionController::Base
  add_flash_types :danger, :info, :warring, :success

  include SessionsHelper
end