require 'spec_helper'

describe "Sessions API Resource" do
  before do
    Veezi.configure do |config|
      config.api_key = "1234567890"
      config.endpoint_url = "http://planetargon.com"
    end

    @client = Veezi.client
  end

  context "All" do
    before do
      response = File.new(File.dirname(__FILE__) + '/fixtures/json/sessions.json')
      stub_request(:get, /.*planetargon.com.*/).to_return { { :body => response } }
    end

    it "should return an array" do
      expect(@client.sessions.all).to be_an_instance_of(Array)
    end

    it "should have two films" do
      expect(@client.sessions.all.size).to eq 2
    end

    it "should have Contraband and The Godfather as the film time title names" do
      expect(@client.sessions.all.map { |movie| movie["Title"] } ).to match_array ["Contraband", "The Godfather"]
    end
  end

  context "Find" do
    before do
      response = File.new(File.dirname(__FILE__) + '/fixtures/json/session.json')
      stub_request(:get, /.*planetargon.com.*/).to_return { { :body => response } }
    end

    it "should return a hash" do
      expect(@client.sessions.find(429)).to be_an_instance_of(Hash)
    end

    it "should have Women on the 6th Floor as the movie title" do
      expect(@client.sessions.find(429)["Title"]).to eq "Women on the 6th Floor"
    end

    it "should have a screen id of 1" do
      expect(@client.sessions.find(429)["ScreenId"]).to eq 1
    end
  end
end