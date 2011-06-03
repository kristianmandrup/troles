require 'trole_spec'
User.troles_strategy :embed_one
User.valid_roles = [:user, :admin]

module UserSetup
  def create_no_roles
    Factory.create :user, :name => 'no roles', :troles => [ ]
  end

  def create_user
    Factory.create :user, :name => 'user', :troles => [ Role.create :name => :user ]
  end

  def create_admin_user
    Factory.create :user, :name => 'admin', :troles => [ Role.create :name => :admin ]
  end
end

describe Troles::Strategy::EmbedOne do
  it_should_behave_like "Common API"
  it_should_behave_like "Trole API"  
end    
