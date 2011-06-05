require 'trole_spec_helper'
require 'troles_spec'                          
require 'models'

User.troles_strategy :embed_many do |c|
  c.valid_roles = [:user, :admin, :blogger, :editor]
end.configure!


module UserSetup
  def create_role name
    Role.create(name)
  end

  def create_no_roles_user
    Factory.create :user, :name => 'no roles', :troles => []
  end

  def create_user
    Factory.create :user, :name => 'normal', :troles => [ create_role(:user) ]
  end

  def create_admin_user
    Factory.create :user, :name => 'admin', :troles => [ create_role(:admin) ]
  end

  def create_complex_user
    Factory.create :user, :name => 'user and admin', :troles => [ create_role(:name => :user), create_role(:name => :admin) ]
  end
end

describe 'Troles strategy embed_many' do
  it_should_behave_like "Common API"
  it_should_behave_like "Troles API"  
end    
