class Album < ApplicationRecord
  has_one :review
  belongs_to :artist
  
  validates :title, {presence: true}
end