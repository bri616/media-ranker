class AddAttributedToToBeer < ActiveRecord::Migration
  def change
    add_column :beers, :attributed_to, :string
  end
end
