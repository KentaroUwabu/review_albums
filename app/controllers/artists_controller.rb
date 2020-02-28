class ArtistsController < ApplicationController
  
  def index
  end
  
  def new
    @artist = Artist.new
  end
  
  def create
    @artist = Artist.new(artist_params)
      @artist.save
      redirect_to("/")
  end
  
  private
  def artist_params
    params.require(:artist).permit(:name, album_attributes:[:id, :title, :image_name, :artist_id])
  end
end
