shared_examples_for "Write API essentials" do
  describe 'Write API' do
    describe '#clear_roles!' do
      it "should clear roles" do
        expect { kris.clear_roles! }.to change { kris.role_value }
        kris.role_list.should be_empty      
      end
    end

    describe '#set_roles' do
      it "should set set roles to :user only" do
        kris.set_roles(:admin)
        kris.has_role?(:admin).should be_true
        kris.has_role?(:user).should be_false
      end
    end

    describe '#add_roles' do
      it "should be that after adding :admin role, he has that role" do
        expect { kris.add_roles(:admin) }.to change{ kris.role_value }
        kris.has_role?(:admin).should be_true
      end
    end

    describe '#remove_roles' do
      it "should remove :user role" do
        expect { kris.remove_roles(:user) }.to change{ kris.role_value }                   
        kris.has_role?(:user).should be_false
      end           
    end
  end
end
