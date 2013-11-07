require "veezi/version"
require "veezi/errors"
require "veezi/configuration"
require "veezi/client"
require "veezi/api/base"
require "veezi/api/parser"
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

    def client
      @client = Veezi::Client.new
    end
  end
end