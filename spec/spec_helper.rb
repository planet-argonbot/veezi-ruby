require 'veezi'
require 'webmock/rspec'

RSpec.configure do |config|
  config.before :suite do
    WebMock.allow_net_connect!
  end
end