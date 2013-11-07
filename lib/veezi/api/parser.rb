module Veezi
  module API
    class Parser
      def initialize(content_type = nil)
        @content_type = content_type || :json
      end

      def parse(content)
        case @content_type.to_sym
          when :xml
            hash = Crack::XML.parse(content)

            if key = hash.keys.find { |key| key =~ /ArrayOf/ }
              hash.fetch(key, {}).delete_if { |k,v| k.include?("xml") }.values.flatten
            else
              hash.values.first || {}
            end
          else
            Crack::JSON.parse(content)
        end
      end
    end
  end
end