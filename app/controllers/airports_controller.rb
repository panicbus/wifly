# require 'nokogiri'
# require 'open-uri'

class AirportsController < ApplicationController

  def welcome

  end

  def index
    @airports = Airport.all
  end

  def new
    @airport = Airport.new


  end

  def create
    new_airport = Airport.create(params[:airport])
      # if new_airport.unique?
      redirect_to airport_path(new_airport.id)#, :notice => "Successfully created airport detail!"
      # else
      #     render :already_created
      # end
  end

  def show
    @airport = Airport.find(params[:id])
  end

  def edit
    @airport = Airport.find(params[:id])
  end

  def update
    found_airport = Airport.find(params[:id])
    found_airport.update_attributes(params[:airport])
    redirect_to found_airport
  end

  def search
    @searched_airports = Airport.search(params[:search])

    query = params[:search]
      #hits the googlemaps API w/ the search query string
      result = Typhoeus.get("http://maps.googleapis.com/maps/api/geocode/json?address=#{query}&sensor=true")
      #parses the json from googlemaps API query
      result_hash = JSON.parse(result.body)
      #iterates through the array of hashes and grabs lat & lng
      result_hash["results"].each do |result|
          @lat = result["geometry"]["location"]["lat"]
          @lng = result["geometry"]["location"]["lng"]
        end

    if @searched_airports.empty?
      render :not_found
    end

  end

end
