class Vinyl < ApplicationRecord
  belongs_to :user
  belongs_to :artist
  has_many :songs

  accepts_nested_attributes_for :songs
end
