require 'ostruct'
class StationService
  def initialize(zip_code)
    @zip_code = zip_code
  end

  def stations
    JSON.parse(Faraday.get("https://developer.nrel.gov/api/alt-fuel-stations/v1/nearest.json?api_key=#{ENV['nrel_key']}&location=#{zip_code}&radius=6.0&fuel_type=ELEC,LPG").body)['fuel_stations'][0..9].map do |station|
      OpenStruct.new(station)
    end
  end

  private
  attr_reader :zip_code
end
