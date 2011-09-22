shared_examples_for "Common Operations API" do
  describe '#list' do
    it 'should clear the roles on clear!' do
      user.clear_roles!
      user.add_roles(:admin, :blogger)
      user.role_list.should include(:admin, :blogger)
    end
  end

  describe '#clear!' do
    it 'should clear the roles on clear!' do
      user.roles.clear!
      expect { user.role_list }.to change{user.role_list_value }
      user.role_list.should be_empty
    end
  end

  describe '#- operator' do
    it 'should remove the :admin role' do
      user.clear_roles!
      user.add_roles(:admin, :blogger)
      user.roles - :admin
      expect { user.role_list }.to change{user.role_list_value }

      user.has_role?(:blogger).should be_true
      user.has_role?(:admin).should be_false
    end
  end

  describe '#+ operator' do
    it 'should add the :admin role' do
      user.clear_roles!
      user.roles + :admin
      expect { user.role_list }.to change{user.role_list_value }
      user.has_role?(:admin).should be_true
    end
  end

  describe '#<< operator' do
    it 'should add the :admin role' do
      user.clear_roles!
      user.roles << :admin
      expect { user.role_list }.to change{user.role_list_value }
      user.has_role?(:admin).should be_true
    end
  end

  describe 'acts as Enumerable' do
    it 'should enable include?' do
      user.clear_roles!
      user.roles << :admin
      user.roles.include?(:admin).should be_true
    end
  end
end
