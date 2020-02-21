class AlbumsController < ApplicationController
  def index
    @albums = Album.all.order(updated_at: :desc)
  end
end
