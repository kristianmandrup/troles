require 'troles_spec'
User.troles_strategy :string_many do |c|
  c.valid_roles = [:user, :admin, :blogger, :editor]
end.configure!

User.valid_roles = [:user, :admin, :blogger, :editor]

module UserSetup
  def create_no_roles_user
    Factory.create :user, :name => 'no roles', :troles => ''
  end

  def create_user
    Factory.create :user, :name => 'normal', :troles => 'user'
  end

  def create_admin_user
    Factory.create :user, :name => 'admin', :troles => 'admin'
  end

  def create_complex_user
    Factory.create :user, :name => 'user and admin', :troles => 'user,admin' 
  end
end

describe 'Troles strategy string_many' do
  it_should_behave_like "Common API"
  it_should_behave_like "Troles API"  
end    
