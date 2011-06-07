shared_examples_for "Trole Write API for two roles :bit_one" do
  describe '#add_role' do
    it "should be that after adding :admin role, he has that role" do
      # lambda { user.add_roles(:admin) }.should raise_error # since it already has :user role and only allows one role!
      user.add_role(:admin)
      user.has_role?(:admin).should be_false
    end
  end

  describe '#add_roles' do
    it "should be that after adding :admin role, he has that role" do
      # lambda { user.add_roles(:admin) }.should raise_error # since it already has :user role and only allows one role!
      user.add_roles(:admin)
      user.has_role?(:admin).should be_false
    end

    it "should be that after adding :admin role, he has that role" do
      user.clear_roles!
      expect { user.add_roles(:admin) }.to_not change{ user.role_value }
      user.has_role?(:admin).should be_false
    end    
  end    
  
  describe '#set_role' do
    it 'should invalidate the role list after roles are changed' do
      user.set_role :admin # editor should be a valid role
      expect { user.role_list }.to change{user.instance_variable_get "@role_list"}
      user.role_name.should == :admin
    end    
  end

  describe '#set_roles' do
    it 'should invalidate the role list after roles are removed' do
      user.set_role :admin # editor should be a valid role
      user.clear_roles!      
      expect { user.role_list }.to change{user.instance_variable_get "@role_list"}
      user.role_name.should == :user
    end    
  end

  describe '#set_roles' do
    it 'should invalidate the role list after roles are changed' do
      user.set_roles :admin # editor should be a valid role
      expect { user.role_list }.to change{user.instance_variable_get "@role_list"}
      user.role_name.should == :admin
    end    
  end
end

shared_examples_for "Trole Operations API for two roles :bit_one" do
  describe '#+' do
    it "should be that trying to add :admin role, he will not be given that role" do
      # lambda { user.add_roles(:admin) }.should raise_error # since it already has :user role and only allows one role!
      user.roles + [:admin]
      user.has_role?(:admin).should be_false
    end
  end

  describe '#-' do
    it "should be that removing :admin role (true) sets him back to :user role (false)" do
      # lambda { user.add_roles(:admin) }.should raise_error # since it already has :user role and only allows one role!
      user.set_roles :admin
      user.roles - [:admin]
      user.has_role?(:admin).should be_false
      user.has_role?(:user).should be_true
    end

    it "should be that removing :user role (true) from user with that role, sets him back to :user role (false) anyways!" do
      # lambda { user.add_roles(:admin) }.should raise_error # since it already has :user role and only allows one role!
      user.set_roles :user
      user.roles - [:user]
      user.has_role?(:admin).should be_false
      user.has_role?(:user).should be_true
    end
  end  
end
