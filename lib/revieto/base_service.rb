require 'http'
require 'json'

module Revieto
  class InvalidApiRequestError < StandardError; end
  class BaseService
    attr_reader :client

    def initialize(client)
      @client = client
    end

    def auth
      'api_key=' + @client.api_key
    end

    def url(action)
      @client.base_url + action
    end

    def get(action)
      HTTP.auth(auth).get(url(action))
    end

    def get_api_rating
      response = get('/api/v1/rating')

      if response.code == 200
        response
      else
        fail InvalidApiRequestError.new("invalid response from API (CODE: #{response.code})")
      end
    end

    def get_api_reviews
      response = get('/api/v1/reviews')

      if response.code == 200
        response
      else
        fail InvalidApiRequestError.new("invalid response from API (CODE: #{response.code})")
      end
    end
  end
end