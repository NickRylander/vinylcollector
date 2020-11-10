class Vinyl < ApplicationRecord
  belongs_to :user
  belongs_to :artist
  has_many :songs

  validates :title, presence: true
  validates :vinyl_size, presence: true
  validate :correct_size

  def correct_size
    if self.vinyl_size != 7 && self.vinyl_size != 12
      errors.add(:vinyl, "Invalid Size")
    end
  end

end
