class MusicsController < ApplicationController
  # index, show, edit, update, new, create, destroy
  def index
    @musics = Music.sorted_by_votes
  end

  def show
    @music = Music.find(params.require(:id))
  end

  def edit
    @music = Music.find(params.require(:id))
    render :template => "/shared/edit_new", :locals => { :obj => @music, :person_att => "Artist" }
  end

  def update
    @music = Music.find(params.require(:id))
    if @music.update(music_params)
      redirect_to music_path
    else
      render :template => "/shared/edit_new", :locals => { :obj => @music, :person_att => "Artist" }
    end
  end

  def new
    @music = Music.new
    render :template => "/shared/edit_new", :locals => { :obj => @music, :person_att => "Artist" }
  end

  def create
    if Music.create(music_params)
      redirect_to musics_path
    else
      render :template => "/shared/edit_new", :locals => { :obj => @music, :person_att => "Artist" }
    end
  end

  def destroy
    @music = Music.find(params.require(:id))
    if @music.destroy
      redirect_to musics_path
    else
      render :show
    end
  end

  def upvote
    @music = Music.find(params.require(:id))
    @music.add_one_vote
    if @music.save
      redirect_to request.referer
    else
      raise "ERROR"
    end
  end

  private

  def music_params
    params.require(:music).permit(:name,:description,:attributed_to)
  end

  def current_music
  end
end
