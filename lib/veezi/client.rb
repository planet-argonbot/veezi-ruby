module Veezi
  attr_reader :configuration

  class Client
    def initialize
      @configuration = Veezi.configuration

      raise InvalidConfiguration unless @configuration.valid?
    end
  end
end