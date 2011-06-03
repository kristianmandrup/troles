require 'trole_spec'
User.troles_strategy :ref_one
User.valid_roles = [:user, :admin, :editor, :blogger]

Role.create(:name => :user)
Role.create(:name => :admin)
Role.create(:name => :editor)


module UserSetup
  def create_no_roles
    Factory.create :user, :name => 'no roles', :troles => [ ]
  end

  def create_user
    Factory.create :user, :name => 'user', :troles => [ Role.where(:name => :user) ]
  end

  def create_admin_user
    Factory.create :user, :name => 'admin', :troles => [ Role.where(:name => :admin) ]
  end
end

describe Troles::Strategy::RefOne do
  it_should_behave_like "Common API"
  it_should_behave_like "Trole API"  
end    

