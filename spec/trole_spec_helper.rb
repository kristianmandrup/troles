require 'rspec'
require 'require_all'
require 'factory_girl'
require 'mocha'
require 'factories'
require 'models'
require 'support/shared_examples'

RSpec.configure do |config|
  config.mock_with :mocha
end
