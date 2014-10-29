class CreateMusics < ActiveRecord::Migration
  def change
    create_table :musics do |t|
      t.string :name
      t.text :description
      t.integer :votes

      t.timestamps
    end
  end
end
