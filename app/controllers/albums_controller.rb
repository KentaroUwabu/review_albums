class AlbumsController < ApplicationController
  
  def index
    @albums = Album.all.order(updated_at: :desc)
  end
  
  def new
    @album = Album.new
  end
  
  def create
    @album = Album.new(
      id: params[:id],
      title: params[:title],
      artist_id: session[:artist_id]
    )
    if @album.save
      session[:album_id] = @album.id
      if params[:image]
        @album.image_name = "#{@album.id}.jpg"
        image = params[:image]
        File.binwrite("public/album_images/#{@album.image_name}", image.read)
      else
        @album.image_name = "default.jpg"
      end
      @album.save
      redirect_to("/reviews/new")
    else
      render("albums/new")
    end
  end
  
  def show
    @album = Album.find_by(id: params[:id])
  end
  
end
