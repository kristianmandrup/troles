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
Troles::Config.log_on = true

dbconfig_path = File.dirname(__FILE__) + '/db/database.yml'
dbfile = File.open(dbconfig_path)
dbconfig = YAML::load(dbfile)  

ActiveRecord::Base.establish_connection(dbconfig)
ActiveRecord::Base.logger = Logger.new(STDERR)

DatabaseCleaner.strategy = :truncation

def migration_folder(name)
  File.dirname(__FILE__) + "/active_record/migrations/#{name}"
end

def migrate name = :ref_many
  singularity = (name.to_s =~ /_many/) ? :many : :one                  
  migration_file = migration_folder(File.join [singularity, name].map(&:to_s))
  puts "mig file: #{migration_file}"
  require migration_file

  "Create#{name.to_s.camelize}".constantize.new.change
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


