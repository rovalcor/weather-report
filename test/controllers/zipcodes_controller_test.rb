require 'test_helper'

class ZipcodesControllerTest < ActionController::TestCase

  def test_show_weather_by_zipcode
    VCR.use_cassette('google_to_darksky_weather_by_zipcode') do
      get :show, params: { id: 72474 }
      assert_response :success
    end
  end
end
