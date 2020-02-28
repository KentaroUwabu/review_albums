class Review < ApplicationRecord
  belongs_to :user
  belongs_to :album
  
  validates :letter, {presence: true}
  validates :album_id, {presence: true}
  validates :user_id, {presence: true}
end
