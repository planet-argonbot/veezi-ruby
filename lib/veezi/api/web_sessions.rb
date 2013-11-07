module Veezi
  module API
    class WebSessions < Base
      def initialize(client)
        @api_path = "/websession"
        super(client)
      end
    end
  end
end