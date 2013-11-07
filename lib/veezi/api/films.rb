module Veezi
  module API
    class Films < Base
      def initialize(client)
        @api_path = "/film"
        super(client)
      end
    end
  end
end