shared_examples_for "Trole Write API for multiple roles" do
  describe '#add_roles' do
    it "should be that after adding :admin role, he has that role" do
      lambda { user.add_roles(:admin) }.should raise_error # since it already has :user role and only allows one role!
      user.has_role?(:admin).should be_false
    end

    it "should be that after adding :admin role, he has that role" do
      user.clear_roles!
      expect { user.add_roles(:admin) }.to change{ user.role_value }
      user.has_role?(:admin).should be_true
    end
    
    it 'should invalidate the role list after roles are changed' do
      # expect roles changed event
      lambda { user.set_roles(:blip) }.should raise_error # invalid role
      user.set_role :editor # editor should be a valid role
      expect { user.role_list }.to change{user.instance_variable_get "@role_list"}
      user.role_name.should == :editor
    end    
  end  

  describe '#clear_roles!' do
    it "should clear all roles and invalidate roles cache" do
      user.set_roles :admin, :editor, :blogger
      user.clear_roles!
      expect { user.role_list }.to change{user.role_list_value }
      user.role_list.should be_empty      
    end
  end

  describe '#set_roles' do
    it "should set multiple valid roles" do
      user.set_roles :admin, :editor, :blogger
      user.has_role?(:admin).should be_true
      user.has_role?(:user).should be_false
      user.has_any_role?(:admin, :editor).should be_true
      user.has_any_role?(:admin, :user).should be_false
      user.has_all_roles?(:admin, :editor, :blogger).should be_true      
    end

    it "should only set valid roles" do
      user.set_roles :admin, nil, :hello, :editor, :blogger, :admin, nil, 'hello'
      user.has_role?(:admin).should be_true
      user.has_role?(:user).should be_false
      user.has_any_role?(:admin, :editor).should be_true
      user.has_any_role?(:admin, :user).should be_false
      user.has_all_roles?(:admin, :editor, :blogger).should be_true      
    end
  end
  
  describe '#remove_roles' do
    it "should remove multiple valid roles and invalidate roles cache" do
      user.set_roles :admin, :editor, :blogger, :user
      user.remove_roles :admin, :blogger
      expect { user.role_list }.to change{user.role_list_value}      

      user.has_any_role?(:admin, :blogger).should be_false
      user.has_any_role?(:admin, :editor).should be_true
      user.has_any_role?(:blogger, :user).should be_true
      
      user.has_all_roles?(:admin, :blogger).should be_false
      user.has_all_roles?(:editor).should be_true
      user.has_role?(:editor).should be_true
    end

    it "should not remove :admin role twice if duplicated in roles argument" do
      user.set_roles :admin, :editor, :blogger
      user.remove_roles :admin, :admin
      expect { user.role_list }.to change{user.role_list_value}      
      user.has_role?(:admin).should be_false
      user.roles.list.should == [:editor, :blogger]
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

shared_examples_for "Trole Operations API for multiple roles" do
  describe '#clear!' do
    it "should clear all roles and invalidate roles cache" do
      user.set_roles :admin
      user.roles << [:admin, :editor, :blogger]
      user.roles.list.should == [:admin, :editor, :blogger]
      user.roles.clear!
      expect { user.role_list }.to change{user.role_list_value }
      user.role_list.should be_empty      
    end
  end

  describe '#+' do
    it "should add multiple valid roles" do
      user.set_roles :admin
      user.roles + [:admin, :editor, :blogger]

      user.roles.list.should == [:admin, :editor, :blogger]
      user.has_role?(:admin).should be_true
      user.has_role?(:user).should be_false

      user.has_any_role?(:admin, :editor).should be_true

      user.has_all_roles?(:admin, :user).should be_false
      user.has_all_roles?(:admin, :editor, :blogger).should be_true      
    end

    it "should only set valid roles" do
      user.set_roles :admin
      user.roles + [:admin, nil, :hello, :editor, :blogger, :admin, nil, 'hello']

      user.has_role?(:hello).should be_false
      user.has_role?(:admin).should be_true
      user.has_role?(:user).should be_false

      user.has_any_role?(:admin, :editor).should be_true
      user.has_any_role?(:admin, :user).should be_false

      user.has_all_roles?(:admin, :editor, :blogger).should be_true      
    end
  end
  
  describe '#-' do
    it "should remove multiple valid roles and invalidate roles cache" do
      user.set_roles :admin, :blogger, :editor, :user
      user.roles - [:admin, :blogger]
      expect { user.role_list }.to change{user.role_list_value}      
      user.has_any_role?(:admin, :blogger).should be_false
      user.has_any_role?(:admin, :editor).should be_true
      user.has_any_role?(:blogger, :user).should be_true
      
      user.has_all_roles?(:admin, :blogger).should be_false
      user.has_all_roles?(:editor).should be_true
      user.has_role?(:editor).should be_true
    end

    it "should not remove :admin role twice if duplicated in roles argument" do
      user.set_roles :admin, :editor, :blogger
      user.remove_roles :admin, :editor, :admin, nil, :blip
      expect { user.role_list }.to change{user.role_list_value}      
      user.has_role?(:admin).should be_false
      user.roles.list.should == [:blogger]
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