module Revieto
  class Reviews < BaseService

    def name
      response = JSON.parse(get_api_reviews.body)

      response['account_name']
    end

    def aggregate_rating
      response = JSON.parse(get_api_reviews.body)

      response['aggregate_rating']
    end

    def rating_count
      response = JSON.parse(get_api_reviews.body)

      response['rating_count']
    end

    def all
      response = JSON.parse(get_api_reviews.body)

      response['reviews']
    end
  end
end