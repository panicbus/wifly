class AirportsController < ApplicationController

  include AirportsHelper

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
      if new_airport.errors.empty?
        create_location(params[:airport][:code])
        redirect_to airport_path(new_airport.id)
      else
        flash[:notice] = new_airport.errors.full_messages
        redirect_to new_airport_path
      end
  end

  def show
    @airport = Airport.find(params[:id])
    unless @airport.location
      create_location(@airport.code)
    end
    @location = @airport.location
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
  end

      # query = params[:search].gsub(/\s/,'%20')
      # result = Typhoeus.post("http://openflights.org/php/apsearch.php/search?city=#{query}&fmt=JSON")
      # result_hash = JSON.parse(result.body)
      # # @iata = []
      # # @lat = []
      # # @long = []

      # result_hash['airports'].each do |result|
      #   @iata = result["iata"]
      #   @lat = result["x"]
      #   @long = result["y"]

        # binding.pry
      # end


    # if @searched_airports.empty? || @searched_airports.details.empty?
    #   render :not_found
    # end


end
