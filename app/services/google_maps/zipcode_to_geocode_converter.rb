require 'net/http'

module GoogleMaps
  module ZipcodeToGeocodeConverter

    GOOGLE_MAPS_GEOCODE_BASE_URL = 'https://maps.googleapis.com/maps/api/geocode/json?'
    COUNTRY_CODE = 'US'

    module_function

    def convert(zipcode)
      params = { components: "country:#{COUNTRY_CODE}|postal_code:#{zipcode}" }
      uri = URI(GOOGLE_MAPS_GEOCODE_BASE_URL + params.to_query)
      req = Net::HTTP.get(uri.host, [uri.path, uri.query].join('?'))
      results = JSON.parse(req)['results']
      results.first['geometry']['location'] if results.present?
    end
  end
end
