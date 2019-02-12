class AddAvatarToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :avatar, :string
    add_column :users, :password, :string
    add_column :users, :password_confirmation, :string
  end
end
