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

    # specify do 
    #   kris.roles.clear! # should be a protected method!
    #   kris.role_list.should be_empty
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
