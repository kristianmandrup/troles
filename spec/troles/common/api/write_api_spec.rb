shared_examples_for "Common Write API" do
  describe '#clear_roles!' do
    it "should clear roles and invalidate roles cache" do
      user.set_roles :admin
      user.clear_roles!
      expect { user.role_list }.to change{user.role_list_value }
      user.role_list.should be_empty      
    end

    it "successive clear roles should not invalidate roles cache" do
      user.set_roles :admin
      user.clear_roles!
      expect { user.role_list }.to change{user.role_list_value }
      user.clear_roles!      
      expect { user.role_list }.to_not change{user.role_list_value }
    end
  end

  describe '#set_roles' do
    it "should set roles to :admin only" do
      user.set_roles(:admin)
      user.has_role?(:admin).should be_true
      user.has_role?(:user).should be_false
    end

    it 'should invalidate the role list after roles are changed' do  
      user.clear_roles!
      user.set_roles :admin
      expect { user.role_list }.to change{user.role_list_value}
      user.has_role?(:admin).should be_true
    end
    
    it 'should not set invalid role and thus not invalidate the role list' do
      # lambda { user.set_roles(:blip) }.should raise_error # invalid role
      user.set_roles(:blip).should be_false
      expect { user.role_list }.to_not change{user.role_list_value}
    end
    
    it "should set roles to one :admin only if duplicated in roles argument" do
      user.set_roles(:admin, :admin)
      expect { user.role_list }.to change{user.role_list_value}      
      user.has_role?(:admin).should be_false
      user.role_list.should == [:admin]
    end    
  end

  
  describe '#remove_roles' do
    it "should not remove :blip role and thus not invalidate roles cache" do
      user.remove_roles :blip
      expect { user.role_list }.to_not change{user.role_list_value}      
    end

    it "should not remove :admin role twice if duplicated in roles argument" do
      user.remove_roles :admin, :admin
      expect { user.role_list }.to change{user.role_list_value}      
      user.has_role?(:admin).should be_false
    end

    it "should remove :admin role and invalidate roles cache" do
      user.set_roles :admin
      expect { user.role_list }.to change{user.role_list_value}      
      expect { user.role_list }.to_not change{user.role_list_value}      
      
      user.remove_roles(:admin).should be_false
      expect { user.role_list }.to change{user.role_list_value}
      user.has_role?(:admin).should be_false
    end           
  end

  describe '#static_role!' do
    pending 'TODO'

    it "should set set roles to :user only" do
      user.static_role!(:guest)
      user.has_role?(:guest).should be_true
      user.valid_roles.should include(:guest)
      lambda { user.set_roles(:admin) }.should raise_error
    end
  end  
end
