require 'trole_spec'
User.troles_strategy :bit_one
User.valid_roles = [:user, :admin]

module UserSetup
  def create_user
    Factory.create :user, :name => 'user', :troles => false
  end

  def create_admin_user
    Factory.create :user, :name => 'admin', :troles => true
  end
end

describe Troles::Strategy::BitOne do
  it_should_behave_like "Common API"
  it_should_behave_like "Trole API"  
end    
