class ZipcodeController < ApplicationController

  def show
    latlng = GoogleMaps::ZipcodeToGeocodeConverter.convert(params[:id])
    temperatures = DarkSky::TemperatureRequestor.get_temperatures_for_today(latlng)
    @current_temperature = temperatures[:current]
    @high_temperature = temperatures[:high]
    @low_temperature = temperatures[:low]
  end
end
