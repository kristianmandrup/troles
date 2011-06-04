shared_examples_for "Common Write API" do
  describe '#clear_roles!' do
    it "should clear roles" do
      expect { user.clear_roles! }.to change { user.role_value }
      user.role_list.should be_empty      
    end
  end

  it 'should invalidate the role list after roles are changed' do
    # expect roles changed event

    # lambda { user.set_roles(:blip) }.should raise_error # invalid role
    user.set_roles(:blip).should be_false

    user.set_roles :editor # editor should be a valid role
    expect { user.role_list }.to change{user.instance_variable_get "@role_list"}
    user.has_role?(:editor).should be_true
  end

  describe '#set_roles' do
    it "should set set roles to :user only" do
      user.set_roles(:admin)
      user.has_role?(:admin).should be_true
      user.has_role?(:user).should be_false
    end
  end
  
  # 
  # describe '#remove_roles' do
  #   it "should remove :user role" do
  #     expect { user.remove_roles(:user) }.to change{ user.role_value }                   
  #     user.has_role?(:user).should be_false
  #   end           
  # end
end
