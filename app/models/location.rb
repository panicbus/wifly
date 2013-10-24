class Location < ActiveRecord::Base
  attr_accessible :city, :latitude, :longitude, :airport_id
  geocoded_by :city

  belongs_to :airport

  after_validation :geocode, :if => :city_changed?

end
