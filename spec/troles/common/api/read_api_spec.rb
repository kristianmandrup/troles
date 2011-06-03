shared_examples_for "Common Read API" do
  specify { user.has_role?(:user).should be_true }
  specify { user.is_role?(:user).should be_true }
        
  specify { user.has_roles?(:user).should be_true }
  specify { user.has_roles?(:user, :admin).should be_false }
        
  specify { user.has_any_role?(:user, :admin).should be_true }
  specify { user.has_any_role?(:admin).should be_false }       

  subject { user }
    its(:role_list)     { should include(:user) }

  it 'should cache the role list' do
    # use mock expectation : don't expect strategy to be called!
    user.role_list.should include(:user)
    user.expects(:strategy).never

    # calling role_list multiple times should NOT invalidate the cache :)
    expect { user.role_list }.to_not change{user.instance_variable_get "@role_list"}      
    user.role_list.should include(:user)      
  end
end