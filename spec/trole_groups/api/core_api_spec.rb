shared_examples_for "TroleGroup Core API" do
  # Core API
  specify             { lambda { user.rolegroup_field }.should raise_error } # no, role_field is a class method    
  specify             { User.rolegroup_field.should_not be_nil } # yes, role_field is a class method    

  subject { user }
    its(:rolegroup_list)     { should include(:blog_admin) }
    its(:rolegroups)         { should be_a TroleGroups::Operations }

  # specify             { user.static_role_groups?.should be_false }
  # specify             { User.static_role_groups?.should be_false }  
  
  # TODO: Add examples with other users?
end
