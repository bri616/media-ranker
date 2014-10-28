class Movie < ActiveRecord::Base
  before_save :default_values

  def default_values
    self.rank ||= 0
  end

  def add_one_vote
    self.rank += 1
  end

  def sorted_by_rank
    
  end


end
