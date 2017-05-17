require 'rails_helper'

describe "Service can make an api call" do
  it "can parse by zip " do
    VCR.use_cassette 'service/stations' do
      response = StationService.new('80218')
      response = response.stations
      response.first.should include("station_name" => 'Walgreens - Denver, CO #1769', "street_address" => "2000 E Colfax", "fuel_type_code" => 'ELEC', "distance" => 0.70964)
    end
  end
end
