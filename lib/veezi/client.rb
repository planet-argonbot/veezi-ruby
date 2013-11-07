module Veezi
  class Client
    attr_reader :configuration

    def initialize
      @configuration = Veezi.configuration

      raise InvalidConfiguration unless @configuration.valid?
    end

    def sessions
      @sessions ||= Veezi::API::Sessions.new(self)
    end
  end
end