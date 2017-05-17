class StationService
  def initialize(zip_code)
    @zip_code = zip_code
  end

  private
  attr_reader :zip_code
end
