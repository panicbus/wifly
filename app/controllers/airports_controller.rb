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
    redirect_to airport_path(new_airport.id)
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
    redirect_to airports_results_path
  end

end
