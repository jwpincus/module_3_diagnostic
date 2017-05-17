class SearchController < ApplicationController
  def index
    @stations = JSON.parse (Faraday.get("https://developer.nrel.gov/api/alt-fuel-stations/v1/nearest.json?api_key=#{ENV['nrel_key']}&location=#{params[:zip_code]}&radius=6.0&fuel_type=ELEC,LPG").body)
    @stations = @stations['fuel_stations'][0..9]
  end
end
