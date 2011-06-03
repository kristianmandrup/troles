require 'troles_spec'
User.troles_strategy :bit_many
User.valid_roles = [:user, :admin, :blogger, :editor]

module UserSetup
  def create_no_roles_user
    Factory.create :user, :name => 'no roles', :troles => []
  end

  def create_user
    Factory.create :user, :name => 'normal', :troles => [ Role.where :name => :user ]
  end

  def create_admin_user
    Factory.create :user, :name => 'admin', :troles => [ Role.where :name => :admin ]
  end

  def create_complex_user
    Factory.create :user, :name => 'user and admin', :troles => [ Role.where(:name => :user), Role.where(:name => :admin) ]
  end
end

describe Troles::Strategy::RefMany do
  it_should_behave_like "Common API"
  it_should_behave_like "Troles API"  
end    
