# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
10.times do
    User.create(email: Faker::Internet.email, password: Faker::Internet.password)
end

10.times do
    Artist.create(name: Faker::Music.band)
end

10.times do
    Vinyl.create(title: Faker::Music.album, vinyl_size: [7, 12].sample, user_id: rand(1..10), artist_id: rand(1..10))
end

10.times do
    Song.create(title: Faker::TvShows::RickAndMorty.quote, duration: rand(60..360), vinyl_id: rand(1..10))
end