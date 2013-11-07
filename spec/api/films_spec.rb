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

      it "should have three films" do
        expect(@client.films.all.size).to eq 3
      end

      it "should have Avatar, Chronicle, and Blade Runner as the film title names" do
        expect(@client.films.all.map { |movie| movie["Title"] } ).to match_array ["Avatar", "Chronicle", "Blade Runner"]
      end

      it "should have 162, 84, and 117 as the film durations" do
        expect(@client.films.all.map { |movie| movie["Duration"] } ).to match_array [162, 84, 117]
      end
    end

    context "Find" do
      before do
        response = File.new(File.dirname(__FILE__) + '/fixtures/json/film.json')
        stub_request(:get, /.*planetargon.com.*/).to_return { { :body => response } }
      end

      it "should return a hash" do
        expect(@client.films.find("ST00000032")).to be_an_instance_of(Hash)
      end

      it "should have Avatar as the movie title" do
        expect(@client.films.find("ST00000032")["Title"]).to eq "Avatar"
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