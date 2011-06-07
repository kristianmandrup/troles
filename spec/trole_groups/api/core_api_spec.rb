shared_examples_for "TroleGroup Core API" do
  # Core API
  specify             { lambda { user.role_field }.should raise_error } # no, role_field is a class method    
  specify             { User.role_field.should_not be_nil } # yes, role_field is a class method    

  subject { user }
    its(:role_list)     { should include(:user) }
    its(:roles)         { should be_a Troles::Operations }

  specify             { user.static_roles?.should be_false }
  specify             { User.static_roles?.should be_false }  
  
  # TODO: Add examples with other users?
end
