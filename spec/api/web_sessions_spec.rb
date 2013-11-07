require 'spec_helper'

describe "Web Sessions API Resource" do
  before do
    Veezi.configure do |config|
      config.api_key = "1234567890"
      config.endpoint_url = "http://planetargon.com"
    end

    @client = Veezi.client
  end

  context "JSON" do
    before do
      Veezi.configure do |config|
        config.content_type = :json
      end
    end

    context "All" do
      before do
        response = File.new(File.dirname(__FILE__) + '/fixtures/json/web_sessions.json')
        stub_request(:get, /.*planetargon.com.*/).to_return { { :body => response } }
      end

      it "should return an array" do
        expect(@client.web_sessions.all).to be_an_instance_of(Array)
      end

      it "should have two films" do
        expect(@client.web_sessions.all.size).to eq 2
      end

      it "should have Contraband and The Godfather as the film time title names" do
        expect(@client.web_sessions.all.map { |movie| movie["Title"] } ).to match_array ["Contraband", "The Godfather"]
      end

      it "should have http://planetargon as the URL" do
        expect(@client.web_sessions.all.map { |movie| movie["URL"] } ).to match_array ["http://planetargon.com", "http://planetargon.com"]
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
        response = File.new(File.dirname(__FILE__) + '/fixtures/xml/web_sessions.xml')
        stub_request(:get, /.*planetargon.com.*/).to_return { { :body => response } }
      end

      it "should return an array" do
        expect(@client.web_sessions.all).to be_an_instance_of(Array)
      end

      it "should have two films" do
        expect(@client.web_sessions.all.size).to eq 2
      end

      it "should have Contraband and The Godfather as the film time title names" do
        expect(@client.web_sessions.all.map { |movie| movie["Title"] } ).to match_array ["Contraband", "The Godfather"]
      end

      it "should have http://planetargon as the URL" do
        expect(@client.web_sessions.all.map { |movie| movie["URL"] } ).to match_array ["http://planetargon.com", "http://planetargon.com"]
      end
    end
  end
end