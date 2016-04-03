module ReviewsCatcher
  class MisconfiguredClientError < StandardError; end
  class Client
    attr_reader :base_url, :app_id, :api_key

    def initialize(app_id: 'my_app_id', api_key: 'my_api_key')
      @app_id = app_id
      @api_key = api_key

      validate_credentials!

      @base_url = build_base_url
    end

    def account
      @account ||= ReviewsCatcher::Account.new(self)
    end

    def reviews
      @reviews ||= ReviewsCatcher::Reviews.new(self)
    end

    private

      def validate_credentials!
        error = MisconfiguredClientError.new('app_id and api_key must not be nil')
        fail error if @app_id.nil? || @api_key.nil?
      end

      def build_base_url
        "http://#{@app_id}.reviewscatcher.io"
      end
  end
end