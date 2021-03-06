class Bench < ApplicationRecord
validates :description, :lat, :lng, presence: true
    
  def self.in_bounds(bounds)
    self.where("lat < ?", bounds[:northEast][:lat])
      .where("lat > ?", bounds[:southWest][:lat])
      .where("lng > ?", bounds[:southWest][:lng])
      .where("lng < ?", bounds[:northEast][:lng])
  end

  def average_rating
    reviews.average(:rating)
  end
end
