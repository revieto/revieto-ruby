require 'spec_helper'

module Revieto
  describe Client do
    let(:api_key) { 'myapikey' }
    let(:client) { Client.new(api_key) }

    it 'should set the base url' do
      expect(client.base_url).to eq('https://www.revieto.com')
    end

    it 'should raise on nil app_key' do
      expect { Client.new(nil) }.to raise_error(MisconfiguredClientError)
    end

    it 'should return an account object' do
      expect(client.account).to be_a(Revieto::Account)
    end

    it 'should return a reviews object' do
      expect(client.reviews).to be_a(Revieto::Reviews)
    end
  end
end