class AlbumsController < ApplicationController
  before_action :authenticate_user, {only: [:new, :create, :destroy, :edit, :update]} 
  before_action :move_to_albums_index, {only: [:new, :create]}
  
  def index
    @albums = Album.all.order(created_at: :desc)
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
  
  def destroy
    @album = Album.find_by(id: params[:id])
    @album.destroy
    @album.review.destroy
    @album.artist.destroy
    redirect_to("/")
  end
  
  def edit
    @album = Album.find_by(id: params[:id])
  end
  
  def update
    @album = Album.find_by(id: params[:id])
    @album.title = params[:title]
    @album.artist.name = params[:name]
    @album.review.letter = params[:letter]
    @album.review.rate = params[:rate]
    if @album.save
      @album.artist.save
      @album.review.save
      redirect_to("/")
    else
      render("albums/edit")
    end
  end
  
end
