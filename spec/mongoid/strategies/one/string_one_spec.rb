require "mongoid/strategy_helper"

User.troles_strategy :string_one do |c|
  c.valid_roles = [:user, :admin, :blogger, :editor]
end.configure!

module UserSetup
  def create_no_roles_user
    Factory.create :user, :name => 'no roles', :trole => ''
  end

  def create_user
    Factory.create :user, :name => 'normal', :trole => 'user'
  end

  def create_admin_user
    Factory.create :user, :name => 'admin', :trole => 'admin'
  end
end

require 'troles/common/api_spec' # Common API examples  

describe 'Troles strategy :string_one' do  
  it_should_behave_like "Common API"
  # it_should_behave_like "Troles API"  
end    
