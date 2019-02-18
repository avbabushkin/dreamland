module ApplicationHelper
  def user_avatar(user)
    user.avatar || asset_path('no_photo.png')
  end
end
