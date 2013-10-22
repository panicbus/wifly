class Location < ActiveRecord::Base
  attr_accessible :city, :latitude, :longitude
  geocoded_by :city
end
