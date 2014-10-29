class RenameDirectorInMovies < ActiveRecord::Migration
  def change
    rename_column :movies, :director, :attributed_to
  end
end
