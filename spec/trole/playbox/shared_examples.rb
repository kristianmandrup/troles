shared_examples_for "Using a :single role strategy for Kris" do
  subject { kris }
    its(:role)          { should be_a Trole::Operations  }
   
    # 
    # specify             { kris.has_role?(:user).should be_true }
    # specify             { kris.is_role?(:user).should be_true }
    # 
    # specify             { kris.has_all_roles?(:user).should be_true }
    # specify             { kris.has_all_roles?(:user, :admin).should be_false }
    # 
    # specify             { kris.has_any_role?(:user, :admin).should be_true }
    # specify             { kris.has_any_role?(:admin).should be_false }       
    
    # # Store Api
    # specify do 
    #   kris.set_role(:admin)
    #   kris.has_role?(:admin).should be_true
    #   kris.has_role?(:user).should be_false
    # end       
    # 
    # specify do 
    #   kris.set_roles(:admin)
    #   kris.has_role?(:admin).should be_true
    #   kris.has_role?(:user).should be_false
    # end       
    # 
    # specify do 
    #   expect { kris.clear_roles! }.to change{kris.instance_variable_get "@trole"}
    #   kris.role_list.should be_empty      
    # end
    # 
    # # Write Api
    # specify do       
    #   expect { kris.add_roles(:admin) }.to change{kris.instance_variable_get "@trole"}
    #   expect { kris.remove_roles(:user) }.to change{kris.instance_variable_get "@trole"}                   
    #   kris.has_role?(:admin).should be_true
    #   kris.has_role?(:user).should be_false
    # end
    # 
    # # # roles - operator
    # specify { lambda { kris.add_roles(:admin, :blogger) }.should raise_error } 
    # 
    # specify do       
    #   expect { kris.add_role(:admin) }.to change{kris.instance_variable_get "@trole"}
    #   expect { kris.remove_role(:user) }.to change{kris.instance_variable_get "@trole"}                   
    #   kris.has_role?(:admin).should be_true
    #   kris.has_role?(:user).should be_false
    # end
    # 
    # # # roles Operations object
    # specify do 
    #   expect { kris.roles.clear! }.to change{kris.instance_variable_get "@trole"}
    #   kris.roles.list.should be_empty      
    # end
    # 
    # specify do 
    #   expect { kris.role.clear! }.to change{kris.instance_variable_get "@trole"}
    #   kris.roles.list.should be_empty      
    # end
    #   
    # # # roles + operator
    # specify do 
    #   expect { kris.roles + :admin }.to change{kris.instance_variable_get "@trole"}
    #   kris.roles.contains?(:admin).should be_true      
    # end
    # 
    # # # roles + operator
    # specify do 
    #   expect { kris.roles - :admin }.to change{kris.instance_variable_get "@trole"}
    #   kris.roles.contains?(:admin).should be_true      
    # end
    # 
    # specify do 
    #   expect { kris.roles - [:admin, :blogger] }.to change{kris.instance_variable_get "@trole"}
    #   kris.roles.contains?(:admin).should be_true      
    # end
    # 
    # # # roles << operator
    # specify do 
    #   kris.clear_roles!
    #   expect { kris.roles << :admin }.to change{kris.instance_variable_get "@trole"}
    #   kris.roles.contains?(:admin).should be_true      
    # end
    # 
    # specify do 
    #   kris.clear_roles!
    #   expect { kris.roles << [:admin, :blogger] }.to change{kris.instance_variable_get "@trole"}
    #   kris.roles.contains?(:admin).should be_true      
    # end
end

shared_examples_for "a Many Single for Susan" do
  subject { susan }
    its(:name)          { should == 'susan' }
    
    # Core API
    its(:role_list)     { should include(:admin) }
end

shared_examples_for "a Many strategy for Jack" do
  subject { jack }
    its(:name)          { should == 'jack' }
    
    # Core API
    its(:role_list)     { should include(:user, :admin) }
end
