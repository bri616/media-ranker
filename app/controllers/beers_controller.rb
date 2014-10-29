class BeersController < ApplicationController
  # index, show, edit, update, new, create, destroy
  def index
    @beers = Beer.sorted_by_votes
  end

  def show
    @beer = Beer.find(params.require(:id))
  end

  def edit
    @beer = Beer.find(params.require(:id))
    render :template => "/shared/edit_new", :locals => { :obj => @beer, :person_att => "Brewery" }
  end

  def update
    @beer = Beer.find(params.require(:id))
    if @beer.update(movie_params)
      redirect_to movie_path
    else
      render :template => "/shared/edit_new", :locals => { :obj => @beer, :person_att => "Brewery" }
    end
  end

  def new
    @beer = Beer.new
    render :template => "/shared/edit_new", :locals => { :obj => @beer, :person_att => "Brewery" }
  end

  def create
    if Beer.create(beer_params)
      redirect_to beers_path
    else
      render :template => "/shared/edit_new", :locals => { :obj => @beer, :person_att => "Brewery" }
    end
  end

  def destroy
    @beer = Beer.find(params.require(:id))
    if @beer.destroy
      redirect_to beers_path
    else
      render :show
    end
  end

  def upvote
    @beer = Beer.find(params.require(:id))
    @beer.add_one_vote
    if @beer.save
      redirect_to beers_path
    else
      raise "ERROR"
    end
  end

  private

  def beer_params
    params.require(:beer).permit(:name,:description,:attributed_to)
  end

  def current_beer
  end
end
