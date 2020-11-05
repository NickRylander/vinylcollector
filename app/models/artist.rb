class Artist < ApplicationRecord
    has_many :vinyls
    has_many :songs, through: :vinyls
    has_namy :users, through: :vinyls
end
