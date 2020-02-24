class AddImageNameToAlbums < ActiveRecord::Migration[5.2]
  def change
    add_column :albums, :image_name, :string
  end
end
