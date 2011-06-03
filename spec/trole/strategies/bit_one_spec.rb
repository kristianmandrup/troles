require 'trole_spec'
User.troles_strategy :bit_one
User.valid_roles = [:user, :admin]

module UserSetup
  def create_user
    Factory.create :user, :name => 'user', :trole => false
  end

  def create_admin_user
    Factory.create :user, :name => 'admin', :trole => true
  end
end

describe Trole::Strategy::BitOne do
  it_should_behave_like "Common API"
  it_should_behave_like "Trole API"  
end    
