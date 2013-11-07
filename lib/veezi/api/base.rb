require 'rest_client'

module Veezi
  module API
    class Base
      attr_accessor :api_path
      attr_reader :client
      attr_reader :parser

      def initialize(client)
        @client = client
        @parser = Veezi::API::Parser.new(self.client.configuration.content_type)
      end

      def configuration
        self.client.configuration
      end

      def content_type
        self.client.configuration.content_type || :json
      end

      def all
        response = request(:get)
        self.parser.parse(response)
      end

      protected
      def request(method, options = {})
        RestClient.send(method, self.configuration.endpoint_url + self.api_path, options.merge({ :accept => self.content_type }))
      end
    end
  end
end