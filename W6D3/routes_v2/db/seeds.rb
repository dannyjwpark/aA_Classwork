# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.new(username: 'Jimmy')
User.new(username: 'Sarah')
User.new(username: 'Lee')

Artwork.new(title: 'Statue of Liberty', image_url: 'statue_of_liberty.png', artist_id: 1)
Artwork.new(title: 'Sunshine', image_url: 'sunshine.png', artist_id: 2)


ArtworkShare.new(artwork_id: 1, viewer_id: 2)
ArtworkShare.new(artwork_id: 2, viewer_id: 3)