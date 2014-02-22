class MapsController < ApplicationController
  def index
  end

  def show
  	location = Location.find_by_id(params[:id])
    @airports = location.airport
    render json: @airports, status: 201
  end

  def create
  end
end
