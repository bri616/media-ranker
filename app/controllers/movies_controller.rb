class MoviesController < ApplicationController
  # index, show, edit, update, new, create, destroy
  def index
    @movies = Movie.sorted_by_votes
  end

  def show
    find_movie
  end

  def edit
    find_movie
    render :template => "/shared/edit_new", :locals => { :obj => @movie, :person_att => "Director" }
  end

  def update
    find_movie
    if @movie.update(movie_params)
      redirect_to movie_path
    else
      render :template => "/shared/edit_new", :locals => { :obj => @movie, :person_att => "Director" }
    end
  end

  def new
    @movie = Movie.new
    render :template => "/shared/edit_new", :locals => { :obj => @movie, :person_att => "Director" }
  end

  def create
    if Movie.create(movie_params)
      redirect_to movies_path
    else
      render :template => "/shared/edit_new", :locals => { :obj => @movie, :person_att => "Director" }
    end
  end

  def destroy
    find_movie
    if @movie.destroy
      redirect_to movies_path
    else
      render :show
    end
  end

  def upvote
    find_movie
    @movie.add_one_vote
    if @movie.save
      redirect_to request.referer
    else
      raise "ERROR"
    end
  end

  private

  def movie_params
    params.require(:movie).permit(:name,:description,:attributed_to)
  end

  def find_movie
    @movie = Movie.find(params.require(:id))
  end
end
