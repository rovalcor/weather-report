require 'test_helper'

class DarkSky::TemperatureRequestorTest < ActiveSupport::TestCase

  def test_get_temperature_for_today
    VCR.use_cassette('dark_sky_temperature_from_latlng') do
      latlng =  { "lat" => 40.755322, "lng" => -73.9932872 }
      temperatures = DarkSky::TemperatureRequestor.get_temperatures_for_today(latlng)
      assert temperatures[:current].present?
      assert temperatures[:high].present?
      assert temperatures[:low].present?
    end
  end
end
