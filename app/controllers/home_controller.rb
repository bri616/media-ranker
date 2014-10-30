class HomeController < ApplicationController
  def index
    @movies = Movie.top_ten
    @beers = Beer.top_ten
    @musics = Music.top_ten
    
  end
end
