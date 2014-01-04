module AirportsHelper
  def create_location(airport_code)
        # encrypt key please!!
    airport = Airport.find_by_code(airport_code) #looks up db based on arpt code
    # code = Airport.code(airport_code)

    result = Typhoeus.get("https://api.flightstats.com/flex/airports/rest/v1/json/iata/#{airport_code}?appId=ba60d138&appKey=6993097a4c89a337452651de4226afe9")
    # binding.pry
    result_hash = JSON.parse(result.body)

    result_hash['airports'].each do |airport|
      @airport_name = airport['name']
      @lat = airport['latitude']
      @long = airport['longitude']
    end
    # binding.pry

    # Airport.update_attributes(name: @airport_name, airport_id: airport.id)
    # Location.create(name: @airport_name, airport_id: airport.id)

     # updates instance of Airport in db with these keys
    airport.update_attributes(name: @airport_name, latitude: @lat, longitude: @long)
    airport.save

  end
end

