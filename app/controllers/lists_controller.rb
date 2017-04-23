class ListsController < ApplicationController
  def show
    @user = User.find(params[:id])
    @songs = List.where(user:@user)
  end

  def add
    song = Song.find(params[:id])
    if List.where(user:current_user).where(song:song).blank?
      List.create(user:current_user, song:song, count:1)
    else
      newCount = List.where(user:current_user).where(song:song).first.count += 1
      List.where(user:current_user).where(song:song).first.update(count:newCount)
    end
    redirect_to '/songs'
  end
end
