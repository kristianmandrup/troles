require 'troles'
require 'trole_spec_helper'
require 'active_record'
require 'yaml'
require 'logger'
require 'database_cleaner'
require 'require_all'
require 'active_record/models'

Troles::Config.default_orm = :active_record
Troles::Config.auto_load = true

dbconfig_path = File.dirname(__FILE__) + '/db/database.yml'
dbfile = File.open(dbconfig_path)
dbconfig = YAML::load(dbfile)  

ActiveRecord::Base.establish_connection(dbconfig)
ActiveRecord::Base.logger = Logger.new(STDERR)

DatabaseCleaner.strategy = :truncation

def migration_folder(name)
  path = File.dirname(__FILE__) + "/migrations/#{name}"
end

def migrate(name)
  singularity = (name =~/_many/) ? :many : :one                  
  ActiveRecord::Migrator.migrate migration_folder File.join(singularity, name)
end

RSpec.configure do |config|
  config.before(:suite) do
    DatabaseCleaner.strategy = :transaction
    DatabaseCleaner.clean_with(:truncation)    
  end

  config.before(:each) do    
    DatabaseCleaner.start
    DatabaseCleaner.drop_tables :users, :roles, :users_roles
    migrate_up
    # api_migrate      
  end

  config.after(:each) do
    DatabaseCleaner.clean
  end  
end


