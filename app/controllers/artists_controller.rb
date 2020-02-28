class ArtistsController < ApplicationController
  
  def new
    @artist = Artist.new
  end
  
  def create
    @artist = Artist.new(
      id: params[:id],
      name: params[:name]
    )
    if @artist.save
      session[:artist_id] = @artist.id
      redirect_to("/albums/new")
    else
      render("artists/new")
    end
  end
  
end