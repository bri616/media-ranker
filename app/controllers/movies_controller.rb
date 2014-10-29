class MoviesController < ApplicationController
  # index, show, edit, update, new, create, destroy
  def index
    @movies = Movie.sorted_by_votes
  end

  def show
    @movie = Movie.find(params.require(:id))
  end

  def edit
    @movie = Movie.find(params.require(:id))
    render :template => "/shared/edit_new", :locals => { :obj => @movie, :person_att => "Director" }
  end

  def update
    @movie = Movie.find(params.require(:id))
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
    @movie = Movie.find(params.require(:id))
    if @movie.destroy
      redirect_to movies_path
    else
      render :show
    end
  end

  def upvote
    @movie = Movie.find(params.require(:id))
    @movie.add_one_vote
    if @movie.save
      redirect_to movies_path
    else
      raise "ERROR"
    end
  end

  private

  def movie_params
    params.require(:movie).permit(:name,:description,:attributed_to)
  end

  def current_movie
  end
end
