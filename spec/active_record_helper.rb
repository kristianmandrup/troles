require 'active_record'
require 'yaml'
# require 'logger'
require 'database_cleaner'
require 'require_all'
require 'active_record/models'

DatabaseCleaner.strategy = :truncation

def migration_folder(name)
  path = File.dirname(__FILE__) + "/migrations/#{name}"
end

def migrate(name)                
  ActiveRecord::Migrator.migrate migration_folder(name)
end

RSpec.configure do |config|
  config.before(:suite) do
    DatabaseCleaner.strategy = :transaction
    DatabaseCleaner.clean_with(:truncation)
  end

  config.before(:each) do
    DatabaseCleaner.start
    # migrate('users')
    # api_migrate      
  end

  config.after(:each) do
    DatabaseCleaner.clean
  end  
end


