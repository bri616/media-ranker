class CreateMovies < ActiveRecord::Migration
  def change
    create_table :movies do |t|
      t.string :name
      t.text :description
      t.string :director
      t.integer :rank

      t.timestamps
    end
  end
end
