require 'spec_helper'

module Revieto
  describe Client do
    let(:app_id) { 'myappid' }
    let(:api_key) { 'myapikey' }
    let(:client) { Client.new(app_id: app_id, api_key: api_key) }

    it 'should set the base url' do
      expect(client.base_url).to eq('https://myappid.revieto.com')
    end

    it 'should raise on nil app_id' do
      expect { Client.new(app_id: nil, api_key: api_key) }.to raise_error(MisconfiguredClientError)
    end

    it 'should raise on nil app_key' do
      expect { Client.new(app_id: app_id, api_key: nil) }.to raise_error(MisconfiguredClientError)
    end

    it 'should raise on nil api_key and app_key' do
      expect { Client.new(app_id: nil, api_key: nil) }.to raise_error(MisconfiguredClientError)
    end

    it 'should return an account object' do
      expect(client.account).to be_a(Revieto::Account)
    end

    it 'should return a reviews object' do
      expect(client.reviews).to be_a(Revieto::Reviews)
    end
  end
end