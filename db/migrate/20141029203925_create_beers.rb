class CreateBeers < ActiveRecord::Migration
  def change
    create_table :beers do |t|
      t.string :name
      t.text :description
      t.integer :votes

      t.timestamps
    end
  end
end
