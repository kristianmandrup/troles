require 'trole_spec'
require 'active_record_helper'

User.troles_strategy :ref_one do |c|
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

describe 'Active Record Adapter' do
  describe 'RefOne strategy' do
    it_should_behave_like "Common API"
    it_should_behave_like "Trole API"  
  end
end