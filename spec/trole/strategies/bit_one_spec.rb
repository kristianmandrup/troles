require 'trole_spec'

User.troles_strategy :bit_one do |c|
  c.valid_roles = [:user, :admin]
end.configure!

module UserSetup
  def create_user
    Factory.create :user, :name => 'user', :trole => false
  end

  def create_admin_user
    Factory.create :user, :name => 'admin', :trole => true
  end
end

describe 'Trole strategy bit_one' do
  it_should_behave_like "Common API"
  it_should_behave_like "Trole API"  
end    
