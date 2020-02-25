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
        )
    if @album.save
      if params[:image]
        @album.image_name = "#{@album.id}.jpg"
        image = params[:image]
        File.binwrite("public/album_images/#{@album.image_name}", image.read)
      else
        @album.image = "default.jpg"
      end
      @album.save
      redirect_to("/reviews/new")
    else
      render("albums/new")
    end
  end
  
end
