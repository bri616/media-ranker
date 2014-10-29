class AddAttributedToToMusic < ActiveRecord::Migration
  def change
    add_column :musics, :attributed_to, :string
  end
end
