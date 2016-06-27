require 'spec_helper'

module Revieto
  describe Reviews do
    let(:client) { Client.new(app_id: 'myappid', api_key: 'myapikey') }

    it 'should return the aggregate rating' do
      api_reviews = test_api_reviews

      stub_reviews_request(client, api_reviews)

      expect(client.reviews.aggregate_rating).to eq(api_reviews['aggregate_rating'])
    end

    it 'should return the account name' do
      api_reviews = test_api_reviews

      stub_reviews_request(client, api_reviews)

      expect(client.reviews.name).to eq(api_reviews['account_name'])
    end

    it 'should return the rating count' do
      api_reviews = test_api_reviews

      stub_reviews_request(client, api_reviews)

      expect(client.reviews.rating_count).to eq(api_reviews['rating_count'])
    end

    it 'should return all of the reviews' do
      api_reviews = test_api_reviews

      stub_reviews_request(client, api_reviews)

      expect(client.reviews.all.count).to eq(api_reviews['reviews'].count)
    end

    it 'should raise an exception if status is not 200' do
      stub_reviews_request(client, nil, 404)

      expect {
        client.reviews.all
      }.to raise_error(InvalidApiRequestError, 'invalid response from API (CODE: 404)')
    end
  end
end