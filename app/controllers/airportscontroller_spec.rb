require 'spec_helper'

describe Airport do
  let(:airport){ Airport.create (city: 'San Francisco', country: 'USA', code: 'SFO')}

  describe '#new' do
    it 'should have @airports equal to Airport.new' do
      @airports.should == Airport.new
  end

end