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
  end  
end