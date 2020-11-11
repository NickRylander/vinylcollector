# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# 10.times do
#     User.create(email: Faker::Internet.email, password: Faker::Internet.password)
# end

3.times do
    Artist.create(name: Faker::Music.band)
end


Vinyl.create(title: Faker::Music.album, vinyl_size: [7, 12].sample, user_id: 1, artist_id: 1)

Vinyl.create(title: Faker::Music.album, vinyl_size: [7, 12].sample, user_id: 1, artist_id: 2)

Vinyl.create(title: Faker::Music.album, vinyl_size: [7, 12].sample, user_id: 1, artist_id: 3)


5.times do
    Song.create(title: Faker::Space.star, duration: rand(60..360), vinyl_id: 1)
end
5.times do
    Song.create(title: Faker::Space.star, duration: rand(60..360), vinyl_id: 2)
end
5.times do
    Song.create(title: Faker::Space.star, duration: rand(60..360), vinyl_id: 3)
end
