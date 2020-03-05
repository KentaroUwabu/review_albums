class ArtistsController < ApplicationController
  
  def new
    @artist = Artist.new
  end
  
  def create
    same_artist = Artist.find_by(name: params[:name])
    @artist = Artist.new(
      id: params[:id],
      name: params[:name]
    )
    if same_artist && @artist.name == same_artist.name
      @artist.id = same_artist.id
    else
      @artist.save
    end
    if session[:artist_id] = @artist.id
      redirect_to("/albums/new")
    else
      render("artists/new")
    end
  end
  
  def show
    @artist = Artist.find_by(id: params[:id])
    @albums = @artist.albums.order(created_at: :desc)
  end
  
end