class AlbumsController < ApplicationController
  
  def index
    @albums = Album.all.order(updated_at: :desc)
  end
  
  def new
    @album = Album.new
    @artist = Artist.new
  end
  
  def create
    @artist = Artiest.new(
      id: params[:id],
      name: params[:name]
    )
    unless @artist.exists(name: params[:name])
      @artist.save
    end
    
    @album = Album.new(
      id: params[:id],
      title: params[:title],
      artist_id: @artist.id
    )
    if @album.save
      if params[:image]
        @album.image_name = "#{@album.id}.jpg"
        image = params[:image]
        File.binwrite("public/album_images/#{@album.image_name}", image.read)
      else
        @album.image_name = "default.jpg"
      end
      @album.save
      redirect_to("/")
    else
      render("albums/new")
    end
  end
  
  def show
    @album = Album.find_by(id: params[:id])
  end
  
end
