require 'spec_helper'

describe Airport do
  let(:airport){ Airport.create( city: 'San Francisco', country: 'USA', code: 'SFO') }

  # it 'should have an id' do
  #   airport.should respond_to(:id)
  #   airport.id.should_not == nil
  # end

 it 'should have a city' do
    airport.should respond_to(:city)
    airport.city.should_not == nil
  end

  it 'should have a country' do
    airport.should respond_to(:country)
    airport.country.should_not == nil
  end

  it 'should have a code' do
    airport.should respond_to(:code)
    airport.code.should_not == nil
  end

end