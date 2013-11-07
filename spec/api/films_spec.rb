require 'spec_helper'

describe "Sessions API Resource" do
  before do
    Veezi.configure do |config|
      config.api_key = "1234567890"
      config.endpoint_url = "http://planetargon.com"
    end

    @client = Veezi.client
  end

  context "JSON" do
    context "All" do
      before do
        response = File.new(File.dirname(__FILE__) + '/fixtures/json/films.json')
        stub_request(:get, /.*planetargon.com.*/).to_return { { :body => response } }
      end

      it "should return an array" do
        expect(@client.films.all).to be_an_instance_of(Array)
      end
    end
  end

  context "XML" do
    before do
      Veezi.configure do |config|
        config.content_type = :xml
      end
    end

    context "All" do
      before do
        response = File.new(File.dirname(__FILE__) + '/fixtures/xml/films.xml')
        stub_request(:get, /.*planetargon.com.*/).to_return { { :body => response } }
      end
    end
  end
end