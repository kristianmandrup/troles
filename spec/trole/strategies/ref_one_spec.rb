require 'trole/strategy_helper'

User.troles_strategy :ref_one do |c|
  c.valid_roles = [:user, :admin, :editor, :blogger]
end.configure!

Config.add_roles [:user, :admin, :editor, :blogger]

module UserSetup
  def create_no_roles
    Factory.create :user, :name => 'no roles', :trole => [ ]
  end

  def create_user
    Factory.create :user, :name => 'user', :trole => [ Role.where(:name => :user) ]
  end

  def create_admin_user
    Factory.create :user, :name => 'admin', :trole => [ Role.where(:name => :admin) ]
  end
end

describe 'Trole strategy ref_one' do
  it_behaves_like "Common API"
  it_behaves_like "Common API for multiple roles"  

  it_behaves_like "Trole API"  
end    

