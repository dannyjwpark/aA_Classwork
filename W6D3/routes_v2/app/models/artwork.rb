class Artwork < ApplicationRecord
    belongs_to :artist,
        primary_key: :id,
        foreign_key: :artist_id,
        class_name: :User

    has_many :artwork_shares,
        primary_key: :id,
        foreign_key: :artwork_id,
        class_name: :ArtworkShare

    has_many :viewers_shared_with,
        through: :artwork_shares,
        source: :shared_viewers
    
end