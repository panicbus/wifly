module AirportsHelper
  def create_location(airport_code)
        # encrypt key please!!
    airport = Airport.find_by_code(airport_code) #looks up db based on arpt code
    result = Typhoeus.get("http://api.locu.com/v1_0/venue/search/?name=#{airport_code}&api_key=2bec4d817e50110d2223c53e5aea35a06503cf1a")
      # parses the json from googlemaps API query
    result_hash = JSON.parse(result.body)
      #iterates through the array of hashes and grabs lat & lng
    result_hash['objects'].each do |result|
        @lat = result['lat']
        @long = result['long']
    end
      # makes new instance of Location in db with these keys
    Location.create(longitude: @long, latitude: @lat, airport_id: airport.id)
  end
end
