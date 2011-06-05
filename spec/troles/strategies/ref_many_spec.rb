require 'trole_spec_helper'
require 'troles_spec'                          
require 'models'

User.troles_strategy :ref_many do |c|
  c.valid_roles = [:user, :admin, :blogger, :editor]
end.configure!

Config.add_roles [:user, :admin, :editor, :blogger]

module UserSetup
  def find_role name
    Role.where :name => name.to_sym
  end
  
  def create_no_roles_user
    Factory.create :user, :name => 'no roles', :troles => []
  end

  def create_user
    Factory.create :user, :name => 'normal', :troles => [ find_role(:user) ]
  end

  def create_admin_user
    Factory.create :user, :name => 'admin', :troles => [ find_role(:admin) ]
  end

  def create_complex_user
    Factory.create :user, :name => 'user and admin', :troles => [ find_role(:user), find_role(:admin) ]
  end
end

describe 'Troles strategy ref_many' do
  it_should_behave_like "Common API"
  it_should_behave_like "Troles API"  
end    
