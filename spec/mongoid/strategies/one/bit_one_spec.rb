require "mongoid/strategy_helper"

User.troles_strategy :bit_one do |c|
  c.valid_roles = [:user, :admin]
end.configure!

module UserSetup
  def create_no_roles_user
    Factory.create :user, :name => 'no roles', :trole => false
  end

  def create_user
    Factory.create :user, :name => 'normal', :trole => false
  end

  def create_admin_user
    Factory.create :user, :name => 'admin', :trole => true
  end
end

require 'troles/common/api_spec' # Common API examples  

describe 'Troles strategy :bit_one' do  
  it_should_behave_like "Common API"
  # it_should_behave_like "Troles API"  
end    
