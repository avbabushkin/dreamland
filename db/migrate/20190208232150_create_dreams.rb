class CreateDreams < ActiveRecord::Migration[5.2]
  def change
    create_table :dreams do |t|
      t.string :dream_title
      t.text :dream_text

      t.timestamps
    end
  end
end
