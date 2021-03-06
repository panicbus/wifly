class AirportsController < ApplicationController

  include AirportsHelper

  def welcome

  end

  # index currently isn't being used
  def index
    @airports = Airport.all
  end

  def new
    @airport = Airport.new
  end

  def create
    # binding.pry
    new_airport = Airport.create(params[:airport])
      if new_airport.errors.empty?  #if there are no errors in the form
        create_location(params[:airport][:code])  #calls the create_location method in airports_helper
        redirect_to airport_path(new_airport.id) # redirects to show method
      else
        flash[:notice] = new_airport.errors.full_messages  #otherwise prints error msgs
        redirect_to new_airport_path #redirects back to create
      end
  end

  def show
    @airport = Airport.find(params[:id])  #locates & sets the airport id w @airport
    # unless @airport.name   #if there is no location (or now, name) assc w/ @airport
    #   create_location(@airport.code) #it creates one with its airport code
    # end

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

    if @searched_airports.empty?
    # if @searched_airports.empty? || @searched_airports.details.empty?
      render :not_found
    end
  end


end

