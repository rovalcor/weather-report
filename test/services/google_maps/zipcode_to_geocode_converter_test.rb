require 'test_helper'

class GoogleMaps::ZipcodeToGeocodeConverterTest < ActiveSupport::TestCase

  def test_convert_valid_zipcode
    VCR.use_cassette('google_with_valid_zipcode') do
      latlng = GoogleMaps::ZipcodeToGeocodeConverter.convert(10018)
      assert latlng['lat'].present?
      assert latlng['lng'].present?
    end
  end

  def test_convert_invalid_zipcode
    VCR.use_cassette('google_with_invalid_zipcode') do
      latlng = GoogleMaps::ZipcodeToGeocodeConverter.convert(9999999)
      assert_nil latlng
    end
  end
end
