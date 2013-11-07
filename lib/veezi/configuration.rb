module Veezi
  class Configuration
    REQUIRED_ATTRIUBTES = %w(api_key endpoint_url)

    attr_accessor :api_key
    attr_accessor :use_ssl
    attr_accessor :endpoint_url
    attr_accessor :content_type
    attr_accessor :api_version

    def initialize
      @api_version ||= "V1"
      @endpoint_url ||= "api.us.veezi.com"
    end

    def valid?
      REQUIRED_ATTRIUBTES.all? { |attribute| !self.send(attribute).nil? }
    end
  end
end