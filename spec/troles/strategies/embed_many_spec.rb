require 'troles_spec'
User.troles_strategy :bit_many
User.valid_roles = [:user, :admin, :blogger, :editor]

module UserSetup
  def create_no_roles_user
    Factory.create :user, :name => 'no roles', :troles => []
  end

  def create_user
    Factory.create :user, :name => 'normal', :troles => [ Role.create :name => :user ]
  end

  def create_admin_user
    Factory.create :user, :name => 'admin', :troles => [ Role.create :name => :admin ]
  end

  def create_complex_user
    Factory.create :user, :name => 'user and admin', :troles => [ Role.create(:name => :user), Role.create(:name => :admin) ]
  end
end

describe Troles::Strategy::EmbedMany do
  it_should_behave_like "Common API"
  it_should_behave_like "Troles API"  
end    
