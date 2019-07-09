class CreateDreams < ActiveRecord::Migration[5.2]
  def change
    create_table :dreams do |t|
      t.text :content
      t.references :user, foreign_key: true

      t.timestamps null: false
    end
    add_index :dreams, [:user_id, :created_at]
  end
end
