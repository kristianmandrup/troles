require 'troles_spec'
User.troles_strategy :bit_many
puts User.static_roles?
User.valid_roles = [:user, :admin, :blogger, :editor]

module UserSetup
  def create_no_roles_user
    Factory.create :user, :name => 'no roles', :troles => 0
  end

  def create_user
    Factory.create :user, :name => 'normal', :troles => 1
  end

  def create_admin_user
    Factory.create :user, :name => 'admin', :troles => 2
  end

  def create_complex_user
    Factory.create :user, :name => 'user and admin', :troles => 3
  end
end

describe Troles::Strategy::BitMany do
  it_should_behave_like "Common API"
  it_should_behave_like "Troles API"  
end    
