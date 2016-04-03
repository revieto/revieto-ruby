module ReviewsCatcher
  class Account < BaseService

    def name
      response = JSON.parse(get_api_rating.body)

      response['account_name']
    end

    def aggregate_rating
      response = JSON.parse(get_api_rating.body)

      response['aggregate_rating']
    end

    def rating_count
      response = JSON.parse(get_api_rating.body)

      response['rating_count']
    end
  end
end