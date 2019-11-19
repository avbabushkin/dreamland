# frozen_string_literal: true

module ApplicationHelper
  def user_avatar(user)
    user.avatar || asset_path('no_photo.png')
  end

  def cut_email(user)
    user.email.split('@')[0]
  end
end
