class Movie < ActiveRecord::Base
  before_save :default_values
  
  def default_values
    self.rank ||= 0
  end

end
