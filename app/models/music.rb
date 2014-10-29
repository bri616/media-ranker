class Music < ActiveRecord::Base
  before_save :default_values

  def default_values
    self.votes ||= 0
  end

  def add_one_vote
    self.votes += 1
  end

  def sorted_by_votes

  end

end
