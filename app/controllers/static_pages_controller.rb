class StaticPagesController < ApplicationController
  def home
    @user = User.all
  end

  def about
  end

  def contact
  end

  def signin
    
  end
end
