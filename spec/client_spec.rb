require 'spec_helper'

describe "Veezi Client" do
  it "should raise an InvalidConfiguration exception if the configuration is invalid" do
    expect { Veezi.client }.to raise_error
  end

  it "should not raise and InvalidConfiguration exception if the configuration is valid" do
    Veezi.configure do |config|
      config.api_key = '12345678890'
      config.endpoint_url = 'endpoint'
    end

    expect { Veezi.client }.not_to raise_error
  end
end