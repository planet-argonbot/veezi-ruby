require 'spec_helper'

describe "Veezi Client" do
  before do
    Veezi.configure do |config|
      config.api_key = nil
    end
  end

  it "should raise an InvalidConfiguration exception if the configuration is invalid" do\
    expect { Veezi.client }.to raise_error Veezi::InvalidConfiguration
  end

  it "should not raise and InvalidConfiguration exception if the configuration is valid" do
    Veezi.configure do |config|
      config.api_key = 'client_key'
      config.endpoint_url = 'endpoint'
    end

    expect { Veezi.client }.not_to raise_error
  end
end