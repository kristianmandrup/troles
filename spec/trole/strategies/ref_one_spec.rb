require 'trole_spec'
User.troles_strategy :ref_one
User.valid_roles = [:user, :admin, :editor, :blogger]

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

describe Trole::Strategy::RefOne do
  it_should_behave_like "Common API"
  it_should_behave_like "Trole API"  
end    

