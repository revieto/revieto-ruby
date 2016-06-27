require 'spec_helper'

module Revieto
  describe Account do
    let(:client) { Client.new(app_id: 'myappid', api_key: 'myapikey') }

    it 'should return the aggregate rating' do
      api_rating = test_api_rating

      stub_rating_request(client, api_rating)

      expect(client.account.aggregate_rating).to eq(api_rating['aggregate_rating'])
    end

    it 'should return the account name' do
      api_rating = test_api_rating

      stub_rating_request(client, api_rating)

      expect(client.account.name).to eq(api_rating['account_name'])
    end

    it 'should return the rating count' do
      api_rating = test_api_rating

      stub_rating_request(client, api_rating)

      expect(client.account.rating_count).to eq(api_rating['rating_count'])
    end

    it 'should raise an exception if status is not 200' do
      stub_rating_request(client, nil, 404)

      expect {
        client.account.aggregate_rating
      }.to raise_error(InvalidApiRequestError, 'invalid response from API (CODE: 404)')
    end
  end
end