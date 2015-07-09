class Weather

  # constructor
  def initialize (latitude, longitude)
    @apikey = "61c7c5d441d1828788e82c3bad858417"
    @latitude = latitude
    @longitude = longitude
    @weather_url = "https://api.forecast.io/forecast/#{@apikey}/#{@latitude},#{@longitude}"
    @weather_data = Hash.new
  end

  def fetchdata
    @buffer = open( @weather_url ).read
    @weather_data = JSON.parse( @buffer )
    @weather_data
  end

  def self.weathericon(conditions)
    case conditions
    when "Partly Cloudy"
      "huge cloud icon"
    when "Mostly Cloudy"
      "huge cloud icon"
    when "Cloudy"
      "huge cloud icon"
    when "Clear"
      "huge sun icon"
    end
  end

end
