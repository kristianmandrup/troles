shared_examples_for "Read API essentials" do
  describe 'Read API' do
    specify { kris.has_role?(:user).should be_true }
    specify { kris.is_role?(:user).should be_true }
            
    specify { kris.has_roles?(:user).should be_true }
    specify { kris.has_roles?(:user, :admin).should be_false }
            
    specify { kris.has_any_role?(:user, :admin).should be_true }
    specify { kris.has_any_role?(:admin).should be_false }       
    
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
    
  end
end