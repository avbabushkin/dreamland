class AddLinkToDreams < ActiveRecord::Migration[5.2]
  def change
    add_column :dreams, :link, :text
  end
end
