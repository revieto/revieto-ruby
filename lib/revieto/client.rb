module Revieto
  class MisconfiguredClientError < StandardError; end
  class Client
    attr_reader :base_url, :api_key

    def initialize(api_key)
      @api_key = api_key

      validate_credentials!

      @base_url = build_base_url
    end

    def account
      @account ||= Revieto::Account.new(self)
    end

    def reviews
      @reviews ||= Revieto::Reviews.new(self)
    end

    private

      def validate_credentials!
        error = MisconfiguredClientError.new('api_key must not be nil')
        fail error if @api_key.nil?
      end

      def build_base_url
        'https://www.revieto.com'
      end
  end
end