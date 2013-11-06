require 'spec_helper'

describe "Configuration Settings" do
  it "should have an api key when defined" do
    Veezi.configure do |config|
      config.api_key = "1234567890"
    end

    expect(Veezi.configuration.api_key).to eq "1234567890"
  end
end