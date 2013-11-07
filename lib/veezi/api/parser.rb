module Veezi
  module API
    class Parser
      def initialize(content_type = nil)
        @content_type = content_type || :json
      end

      def parse(content)
        case @content_type.to_sym
          when :xml
            Crack::XML.parse(content)
          else
            Crack::JSON.parse(content)
        end
      end
    end
  end
end