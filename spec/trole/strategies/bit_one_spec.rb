require 'trole/strategy_helper'

User.troles_strategy :bit_one, :generic => true do |c|
  # c.valid_roles = [:user, :admin]
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
  it_behaves_like "Common API"
  it_behaves_like "Trole API for two roles :bit_one"

  it_behaves_like "Trole API"  
end    
