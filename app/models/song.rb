class Song < ApplicationRecord
  belongs_to :vinyl
  has_many :users, through: :vinyls
  has_one :artist, through: :vinyl
end
