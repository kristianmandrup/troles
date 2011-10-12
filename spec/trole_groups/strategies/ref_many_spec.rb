require 'trole_groups/strategy_helper'

# define how User stores roles
User.troles_strategy :ref_many do |c|
  c.valid_roles = [:user, :admin, :blogger, :editor]
end.configure!

# define how User stores rolegroups
User.trolegroups_strategy :ref_many do |c|
  c.valid_rolegroups = [:blog_admin, :super_admin]
end.configure!

# define how RoleGroup stores roles! 
RoleGroup.troles_strategy :ref_many do |c|
  c.valid_roles = [:user, :admin, :blogger, :editor]
end.configure!

# Add them roles
Config.add_roles [:user, :admin, :editor, :blogger]

Config.add_rolegroups :blog_admin => [:blogger, :blog_editor], :super_admin => [:admin, :blog_admin]

module UserSetup
  def find_role name
    Role.where :name => name.to_sym
  end

  def find_rolegroup name
    RoleGroup.where :name => name.to_sym
  end
  
  def create_no_rolegroup_user
    Factory.create :user, :name => 'no roles', :trole_groups => []
  end

  def create_user
    Factory.create :user, :name => 'normal', :trole_groups => [ find_rolegroup(:blog_admin) ]
  end

  def create_super_admin_user
    Factory.create :user, :name => 'admin', :troles => [ find_role(:super_admin) ]
  end

  def create_comlex_admin_user
    Factory.create :user, :name => 'admin', :troles => [ find_role(:super_admin) ], :troles => [ find_role(:user), find_role(:admin) ]
  end
end

describe 'TroleGroup strategy :ref_many' do
  it_behaves_like "TroleGroup API"
end    
