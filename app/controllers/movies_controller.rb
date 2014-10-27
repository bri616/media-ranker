class MoviesController < ApplicationController
  # index, show, edit, update, new, create, destroy
  def index
  end

  def show
    @movies = Movie.all
  end

  def edit
  end

  def update
  end

  def new
    @movie = Movie.new
  end

  def create

  end

  def destroy
  end
end
