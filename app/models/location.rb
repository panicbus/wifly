class Location < ActiveRecord::Base
  attr_accessible :city, :latitude, :longitude, :airport_id

  belongs_to :airport

end
