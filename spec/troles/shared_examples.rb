shared_examples_for "a Many strategy for Kris" do
  subject { kris }
    its(:name)          { should == 'kris' }

    # Core API
    its(:troles)        { should == 1 }
    specify             { lambda { kris.role_field }.should raise_error } # is a class method    
    specify             { User.role_field.should == :troles }

    its(:roles)         { should be_a Troles::Operations }
    its(:role_list)     { should include(:user) }

    specify             { kris.static_roles?.should be_false }
    specify             { User.static_roles?.should be_false }
end

shared_examples_for "a Many strategy for Susan" do
  subject { susan }
    its(:name)          { should == 'susan' }
    its(:troles)        { should == 2 }
    
    # Core API
    its(:role_list)     { should include(:admin) }
end

shared_examples_for "a Many strategy for Jack" do
  subject { jack }
    its(:name)          { should == 'jack' }
    its(:troles)        { should == 3 }
    
    # Core API
    its(:role_list)     { should include(:user, :admin) }
end
