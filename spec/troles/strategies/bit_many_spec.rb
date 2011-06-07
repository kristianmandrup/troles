require 'strategy_helper'

User.troles_strategy :bit_many do |c|
  c.valid_roles = [:user, :admin, :blogger, :editor]
end.configure!

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

describe 'Troles strategy bit_many' do
  it_behaves_like "Common API"
  it_behaves_like "Common API for multiple roles"  

  it_behaves_like "Troles API"  
end    
