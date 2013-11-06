require "veezi/version"
require "veezi/configuration"
require "veezi/api/base"
require "veezi/api/sessions"

module Veezi
  class << self
    def configure(config = nil)
      if config
        config.each do |k,v|
          configuration.send("#{k}=", v) rescue nil if configuration.respond_to?("#{k}=")
        end
      end

      yield(configuration) if block_given?
    end

    def configuration
      @configuration ||= Veezi::Configuration.new
    end
  end
end