class PlaylistsController < ApplicationController
  # index
  def index
    @playlists = User.find(session[:user]["id"]).playlists
  end

  # new
  def new
    @playlist = Playlist.new
  end

  # create
  def create
    @user = User.find(session[:user]["id"])
    @playlist = @user.playlists.create!(playlist_params)
    redirect_to playlist_path(@playlist)
  end

  #show
  def show
    @playlist = Playlist.find(params[:id])
  end

  # edit
  def edit
    @playlist = Playlist.find(params[:id])
  end


  # update
  def update
    @playlist = Playlist.find(params[:id])
    @playlist.update(playlist_params)
    redirect_to playlist_path(@playlist)
  end

  # destroy
  def destroy
    @playlist = Playlist.find(params[:id])
    @playlist.destroy
    redirect_to playlists_path
  end

  private
  def playlist_params
    params.require(:playlist).permit(:name, :datetime, :songs, :user_id)
  end
end
