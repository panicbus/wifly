class Location < ActiveRecord::Base
  attr_accessible :city, :latitude, :longitude, :name, :airport_id

  geocoded_by :name
  after_validation :geocode, :if => :name_changed?

  belongs_to :airport

end
