class Song < ApplicationRecord
  belongs_to :vinyl
  has_many :users, through: :vinyls
  has_one :artist, through: :vinyl

  validates :title, presence: true
  validates :duration, presence: true
end
