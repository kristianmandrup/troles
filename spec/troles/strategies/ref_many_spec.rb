require 'troles_spec'
User.troles_strategy :ref_many
User.valid_roles = [:user, :admin, :blogger, :editor]

Config.add_roles [:user, :admin, :editor, :blogger]

puts "Roles: #{Role.all.inspect}"

module UserSetup
  def find_role name
    Role.where :name => name.to_sym
  end
  
  def create_no_roles_user
    Factory.create :user, :name => 'no roles', :troles => []
  end

  def create_user
    Factory.create :user, :name => 'normal', :troles => [ find_role(:user) ]
  end

  def create_admin_user
    Factory.create :user, :name => 'admin', :troles => [ find_role(:admin) ]
  end

  def create_complex_user
    Factory.create :user, :name => 'user and admin', :troles => [ find_role(:user), find_role(:admin) ]
  end
  
  def create_user_without_troles_field
    Factory.create :user, :name => "no roles"
  end

end

describe Troles::Strategy::RefMany do
  it_should_behave_like "Common API"
  it_should_behave_like "Troles API"  
end    
