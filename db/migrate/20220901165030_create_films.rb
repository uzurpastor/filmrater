class CreateFilms < ActiveRecord::Migration[7.0]
  def change
    create_table :films do |t|
      t.string :title, null: false
      t.text :description, null: false
      t.string :category, null: false
      
      t.timestamps
    end
  end
end
