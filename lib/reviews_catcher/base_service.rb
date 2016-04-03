require 'net/http'
require 'uri'
require 'json'

module ReviewsCatcher
  class InvalidApiRequestError < StandardError; end
  class BaseService
    attr_reader :client

    def initialize(client)
      @client = client
    end

    def uri(action)
      URI.parse(@client.base_url + action)
    end

    def authorization_header_value
      "api_key=#{@client.api_key}"
    end

    def get(action)
      uri = self.uri(action)

      http = Net::HTTP.new(uri.host, uri.port)
      http.open_timeout = 3 # in seconds
      http.read_timeout = 3 # in seconds

      request = Net::HTTP::Get.new(uri.request_uri)
      request['Authorization'] = authorization_header_value

      http.request(request)
    end

    def get_api_rating
      response = get('/api/v1/rating')

      if response.code == '200'
        response
      else
        fail InvalidApiRequestError.new("invalid response from API (CODE: #{response.code})")
      end
    end

    def get_api_reviews
      response = get('/api/v1/reviews')

      if response.code == '200'
        response
      else
        fail InvalidApiRequestError.new("invalid response from API (CODE: #{response.code})")
      end
    end
  end
end