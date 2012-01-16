require 'rspec'
require 'mocha'
require 'rack_gyazo'
require 'rack/test'
require 'pry'

RSpec.configure do |config|
  config.mock_with :mocha
end
