# frozen_string_literal: true

# Static pages only
class StaticPagesController < ApplicationController
  def home
    if current_user.present?
      redirect_to user_url(current_user)
    else
      render :home
    end
  end

  def about; end

  def contact; end

  def signin; end

  def denial; end
end
