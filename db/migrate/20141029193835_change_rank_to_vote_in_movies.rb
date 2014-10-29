class ChangeRankToVoteInMovies < ActiveRecord::Migration
  def change
    rename_column :movies, :rank, :votes
  end
end
