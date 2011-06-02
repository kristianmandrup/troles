shared_examples_for "Core API essentials" do
  describe 'Core API' do
    # Core API
    specify             { lambda { kris.role_field }.should raise_error } # no, role_field is a class method    
    specify             { User.role_field.should == :trole } # yes, role_field is a class method    

    its(:role_list)     { should include(:user) }
    its(:roles)         { should be_a Troles::Operations }

    specify             { kris.static_roles?.should be_false }
    specify             { User.static_roles?.should be_false }
  end
end
