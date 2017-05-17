class SearchController < ApplicationController
  def index
    byebug
    @stations = Faraday.get("https://developer.nrel.gov/api/alt-fuel-stations/v1/nearest.json?api_key=ENV['nrel_key']location=80218&radius=6.0&fuel_type=ELEC,LPG")
  end
end
