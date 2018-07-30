class ZipcodeController < ApplicationController

  def show
    latlng = GoogleMaps::ZipcodeToGeocodeConverter.convert(params[:id])

    if latlng.present?
      temperatures = DarkSky::TemperatureRequestor.get_temperatures_for_today(latlng)
      @current_temperature = temperatures[:current]
      @high_temperature = temperatures[:high]
      @low_temperature = temperatures[:low]
    else
      render template: 'zipcode/not_found', status: :not_found
    end
  end
end
