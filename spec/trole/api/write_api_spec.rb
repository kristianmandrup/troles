shared_examples_for "Trole Write API" do
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
end