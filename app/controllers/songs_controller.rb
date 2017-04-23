class SongsController < ApplicationController
  def index
    @songs = Song.all
    @current_user = current_user
  end

  def show
    @song = Song.find(params[:id])
    @users = List.where(song: @song)

  end

  def add
    songparams = params.require(:song).permit(:artist, :title)

    song = Song.new(songparams)
    if song.valid?
      song.save
    else
      flash[:notice] = song.errors.full_messages
    end
    
    redirect_to '/songs'
  end
end
