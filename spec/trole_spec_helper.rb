require 'rspec'
require 'require_all'
require 'factory_girl'
require 'mocha'
require 'factories'
require 'support/shared_examples'

module Config
  def self.create_role name
    Role.create(:name => name.to_s)
  end

  def self.create_rolegroup name, options = {}
    RoleGroup.create(:name => name.to_s, :roles => options[:roles])
  end

  def self.add_rolegroups hash
    names.flatten.each_pair {|name, roles| create_rolegroup(name, :roles => roles) }
  end


  def self.add_roles *names
    names.flatten.each {|n| create_role(n) }
  end
end

RSpec.configure do |config|
  config.mock_with :mocha
end
