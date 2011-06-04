shared_examples_for "Common Read API" do
  include UserSetup
  specify { user.has_role?(:user).should be_true }
  specify { user.is_role?(:user).should be_true }
        
  specify { user.has_roles?(:user).should be_true }
  specify { user.has_roles?(:user, :admin).should be_false }
        
  specify { user.has_any_role?(:user, :admin).should be_true }
  specify { user.has_any_role?(:admin).should be_false }       

  subject { user }
    its(:role_list)     { should include(:user) }

  describe "user without trole_field initialized" do
    it "should get empty role_list" do
      user_without_troles_field.role_list.should_not be_nil
    end
  end

  it 'should cache the role list' do
    # use mock expectation : don't expect strategy to be called!
    user.role_list.should include(:user)
    user.expects(:strategy).never

    # calling role_list multiple times should NOT invalidate the cache :)
    expect { user.role_list }.to_not change{user.instance_variable_get "@role_list"}      
    user.role_list.should include(:user)      
  end

  it 'should invalidate the role list after roles are changed' do
    # expect roles changed event
    user.set_roles :blip # invalid role
    user.role_name.should == :user # invalid role admin

    user.set_role :editor # editor should be a valid role
    expect { user.role_list }.to change{user.instance_variable_get "@role_list"}
    user.role_name.should == :editor
  end

end
