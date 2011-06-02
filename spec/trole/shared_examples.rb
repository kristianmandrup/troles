shared_examples_for "Using a :single role strategy for Kris" do
  subject { kris }
    # Core API
    specify       { lambda { kris.role_field }.should raise_error } # is a class method    
    specify       { User.role_field.should == :trole }

    its(:roles)         { should be_a Troles::Operations }
    its(:role)          { should be_a Trole::Operations } # alias to roles
    its(:role_list)     { should include(:user) }

    specify             { kris.static_roles?.should be_false }
    specify             { User.static_roles?.should be_false }

    describe 'Event API' do
      # Event API
      its(:event_manager) { should == Trole::EventManager }
      specify             { lambda { kris.field_changed? }.should raise_error } # since not using rails here!   
      specify             { kris.publish_change(:roles).should be_true }
      specify             { kris.update_roles.should be_false } # since not using rails   
    end

    # Read API
    its(:role_list)     { should include(:user) }
    
    it 'should cache the role list' do
      # use mock expectation : don't expect strategy to be called!
      kris.role_list.should include(:user)
      kris.expects(:strategy).never
      # calling role_list multiple times should NOT invalidate the cache :)
      expect { kris.role_list }.to_not change{kris.instance_variable_get "@role_list"}      
      kris.role_list.should include(:user)      
    end
    
    it 'should invalidate the role list after roles are changed' do
      # expect roles changed event
      kris.set_roles :admin
      kris.role_name.should == :user # invalid role admin
      
      kris.set_role :editor
      expect { kris.role_list }.to change{kris.instance_variable_get "@role_list"}
      kris.role_name.should == :editor
    end
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
