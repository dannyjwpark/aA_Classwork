class User < ApplicationRecord
    validates :username, presence: true

    has_many :artworks,
        primary_key: :id,
        foreign_key: :artist_id,
        class_name: :Artwork

    has_many :artwork_shares,
        primary_key: :id,
        foreign_key: :viewer_id,
        class_name: :ArtworkShare
        dependent: :destroy

    has_many :shared_artworks,
        through: :artwork_shares,
        source: :artwork

    has_many :comments,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: :Comment,
    dependent: :destroy
end