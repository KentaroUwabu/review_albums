class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.string :title
      t.text :letter
      t.integer :album_id
      t.integer :user_id
      t.integer :rate
      t.timestamps
    end
  end
end
