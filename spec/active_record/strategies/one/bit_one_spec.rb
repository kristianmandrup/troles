require "active_record/strategy_helper"
require "active_record/migrations/one/bit_one"

def migrate_up
  CreateBitOne.up # run migration
end

def migrate_down
  CreateBitOne.down
end      

User.troles_strategy :bit_one do |c|
  c.valid_roles = [:user, :admin, :blogger, :editor]
end.configure!

module UserSetup
  def create_no_roles_user
    Factory.create :user, :name => 'no roles', :troles => false
  end

  def create_user
    Factory.create :user, :name => 'normal', :troles => false
  end

  def create_admin_user
    Factory.create :user, :name => 'admin', :troles => true
  end
end

require 'troles/common/api_spec' # Common API examples  

describe 'Troles strategy :bit_one' do  
  it_should_behave_like "Common API"
  # it_should_behave_like "Troles API"  
end    
