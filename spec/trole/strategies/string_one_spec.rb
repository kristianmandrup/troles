require 'trole_spec'
User.troles_strategy :string_one
User.valid_roles = [:user, :admin, :editor, :blogger]

module UserSetup
  def create_no_roles
    Factory.create :user, :name => 'no roles', :troles => ''
  end

  def create_user
    Factory.create :user, :name => 'user', :troles => 'user'
  end

  def create_admin_user
    Factory.create :user, :name => 'admin', :troles => 'admin'
  end
end

describe Troles::Strategy::StringOne do
  it_should_behave_like "Common API"
  it_should_behave_like "Trole API"  
end    
