class AddColumnTitleToDream < ActiveRecord::Migration[5.2]
  def change
    add_column :dreams, :title, :string
  end
end
