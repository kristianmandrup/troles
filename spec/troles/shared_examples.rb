shared_examples_for "a Many strategy for Kris" do
  subject { kris }
    its(:name)          { should == 'kris' }

    # Core API
    specify             { lambda { kris.role_field }.should raise_error } # is a class method    
    specify             { User.role_field.should == :troles }

    its(:roles)         { should be_a Troles::Operations }

    specify             { kris.static_roles?.should be_false }
    specify             { User.static_roles?.should be_false }

    # Event API
    its(:event_manager) { should == Troles::EventManager }
    specify             { lambda { kris.field_changed? }.should raise_error } # since not using rails here!   
    specify             { kris.publish_change(:roles).should be_true }
    specify             { kris.update_roles.should be_false } # since not using rails   

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
      kris.expects(:invalidate_role_cache!)
      kris.set_roles(:admin)
      # expect cached role_list instance variable (cache) to be changed
      expect { kris.role_list }.to change{kris.instance_variable_get "@role_list"}
      kris.role_list.should include(:admin)            
    end
    
    specify             { kris.has_role?(:user).should be_true }
    specify             { kris.is_role?(:user).should be_true }

    specify             { kris.has_all_roles?(:user).should be_true }
    specify             { kris.has_all_roles?(:user, :admin).should be_false }

    specify             { kris.has_any_role?(:user, :admin).should be_true }
    specify             { kris.has_any_role?(:admin).should be_false }       
    
    # Store Api
    specify do 
      kris.set_roles(:admin)
      kris.has_role?(:admin).should be_true
      kris.has_role?(:user).should be_false
    end       

    specify do 
      expect { kris.clear_roles! }.to change{kris.instance_variable_get "@troles"}
      kris.role_list.should be_empty      
    end

    # Write Api
    specify do       
      expect { kris.add_roles(:admin) }.to change{kris.instance_variable_get "@troles"}
      expect { kris.remove_roles(:user) }.to change{kris.instance_variable_get "@troles"}                   
      kris.has_role?(:admin).should be_true
      kris.has_role?(:user).should be_false
    end

    # # roles Operations object
    # specify do 
    #   expect { kris.roles.clear! }.to change{kris.instance_variable_get "@troles"}
    #   kris.publish_change :roles      
    #   kris.roles.list.should be_empty      
    # end

    # # roles - operator
    # specify do 
    #   kris.add_roles(:admin, :blogger)
    #   expect { kris.roles - :admin }.to change{kris.instance_variable_get "@troles"}
    #   kris.publish_change :roles      
    # 
    #   kris.roles.contains?(:blogger).should be_true      
    #   kris.roles.contains?(:admin).should be_false
    # end
    # 
    # # roles + operator
    # specify do 
    #   expect { kris.roles + :admin }.to change{kris.instance_variable_get "@troles"}
    #   kris.publish_change :roles      
    #   kris.roles.contains?(:admin).should be_true      
    # end
    # 
    # # roles << operator
    # specify do 
    #   kris.clear_roles!
    #   expect { kris.roles << :admin }.to change{kris.instance_variable_get "@troles"}
    #   kris.publish_change :roles      
    #   kris.roles.contains?(:admin).should be_true      
    # end
end

shared_examples_for "a Many strategy for Susan" do
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
