class Music < ActiveRecord::Base
  before_save :default_values

  def self.sorted_by_votes
    order(votes: :desc)
  end

  def self.top_ten
    sorted_by_votes.first(10)
  end

  def default_values
    self.votes ||= 0
  end

  def add_one_vote
    self.votes += 1
  end

end
