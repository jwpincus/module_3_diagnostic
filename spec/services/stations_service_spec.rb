require 'rails_helper'

describe "Service can make an api call" do
  it "can parse by zip " do
    VCR.use_cassette 'service/stations' do
      response = StationService.new('80218')
      response = response.stations
      response.first.should respond_to(:station_name , "street_address", "fuel_type_code", "distance")
    end
  end
end
