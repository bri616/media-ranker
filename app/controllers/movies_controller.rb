class MoviesController < ApplicationController
  # index, show, edit, update, new, create, destroy
  def index
    @movies = Movie.all
  end

  def show
    @movie = Movie.find(params.require(:id))
  end

  def edit
    @movie = Movie.find(params.require(:id))
  end

  def update
    @movie = Movie.find(params.require(:id))
    if @movie.update(movie_params)
      redirect_to movie_path
    else
      render :edit
    end
  end

  def new
    @movie = Movie.new
  end

  def create
    if Movie.create(movie_params)
      redirect_to movies_path
    else
      render :new
    end
  end

  def destroy
  end

  private

  def movie_params
    params.require(:movie).permit(:name,:description,:director)
  end
end
