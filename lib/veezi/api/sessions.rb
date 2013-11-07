module Veezi
  module API
    class Sessions < Base
      def initialize(client)
        @api_path = "/session"
        super(client)
      end
    end
  end
end