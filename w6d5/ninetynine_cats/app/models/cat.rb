require 'action_view'
# require 'date'

class Cat < ApplicationRecord  
  include ActionView::Helpers::DateHelper

  validates :birth_date, :color, :name, :sex, :description, presence: true
  validates :color, inclusion: ["Black", "Blue", "Brown", "Mixed", "Orange","White"]
  validates :sex, inclusion: ["M", "F"]

  
  #birthdate: Tue, 20 Jan 2015
  def age
    # from_time = self.birth_date.ago
    # time_ago_in_words(from_time)
    # :age = Date.today.year - self.birth_date.year

    today = Date.today
    age = ((today - self.birth_date) / 365).to_i
  end

end