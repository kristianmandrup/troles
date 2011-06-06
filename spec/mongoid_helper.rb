require 'troles'
require 'trole_spec_helper'
require 'mongoid'
require 'bson'
require 'mongoid/models'

Troles::Config.default_orm = :mongoid

Mongoid.configure.master = Mongo::Connection.new.db('troles_mongoid')

Mongoid.database.collections.each do |coll|
  coll.remove
end

RSpec.configure do |config|
  config.mock_with :mocha
end

