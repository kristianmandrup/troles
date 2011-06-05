require "active_record/strategy_helper"
require "active_record/migrations/many/string_many"
CreateStringMany.up # run migration

User.troles_strategy :string_many do |c|
  c.valid_roles = [:user, :admin, :blogger, :editor]
end.configure!

module UserSetup
  def create_no_roles_user
    Factory.create :user, :name => 'no roles', :troles => ''
  end

  def create_user
    Factory.create :user, :name => 'normal', :troles => 'user'
  end

  def create_admin_user
    Factory.create :user, :name => 'admin', :troles => 'admin'
  end

  def create_complex_user
    Factory.create :user, :name => 'user and admin', :troles => 'user,admin' 
  end
end


require 'troles/common/api_spec' # Common API examples  

describe 'Troles strategy string_many' do  
  after do
    CreateStringMany.down
  end

  it_should_behave_like "Common API"
  # it_should_behave_like "Troles API"  
end    
