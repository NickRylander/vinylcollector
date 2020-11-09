class Vinyl < ApplicationRecord
  belongs_to :user
  belongs_to :artist
  has_many :songs

  validates :title, presence: true
  validates :vinyl_size, presence: true


end
