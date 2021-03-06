require 'test_helper'

class ZipcodeControllerTest < ActionController::TestCase

  def test_show_weather_by_valid_zipcode
    VCR.use_cassette('google_to_darksky_weather_by_zipcode') do
      get :show, params: { id: 10018 }
      assert_response :success

      assert assigns(:current_temperature).present?
      assert assigns(:high_temperature).present?
      assert assigns(:low_temperature).present?
    end
  end

  def test_show_weather_by_unknown_zipcode
    VCR.use_cassette('google_with_invalid_zipcode') do
      get :show, params: { id: 9999999 }
      assert_response :not_found
    end
  end
end
