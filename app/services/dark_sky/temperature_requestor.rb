require 'net/http'

module DarkSky
  module TemperatureRequestor

    API_KEY = 'f9c150e185b295390f0192efbf3d5e3d'
    DARK_SKY_FORECAST_BASE_URL = "https://api.darksky.net/forecast/#{API_KEY}"

    module_function

    def get_temperatures_for_today(latlng)
      uri = URI.parse(DARK_SKY_FORECAST_BASE_URL + "/#{latlng['lat']},#{latlng['lng']}")
      req = Net::HTTP.get(uri)
      response = JSON.parse(req)
      temperatures = {}

      temperatures[:current] = response['currently']['temperature']
      temperatures[:low] = response['daily']['data'].first['temperatureLow']
      temperatures[:high] = response['daily']['data'].first['temperatureHigh']

      temperatures
    end
  end
end
