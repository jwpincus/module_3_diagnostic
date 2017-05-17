class SearchController < ApplicationController

  def index
    @stations = StationService.new(params[:zip_code]).stations
  end

end
