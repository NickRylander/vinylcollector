class Vinyl < ApplicationRecord
  belongs_to :user
  belongs_to :artist
  has_many :songs
end