shared_examples_for "Troles Operations Api essentials" do
  describe 'Store Api' do
    
    describe '#list' do    
      it 'should clear the roles on clear!' do
        kris.add_roles(:admin, :blogger)
        kris.role_list.should include(:admin, :blogger)      
      end
    end

    describe '#clear!' do    
      it 'should clear the roles on clear!' do
        expect { kris.roles.clear! }.to change{ kris.role_value }
        kris.role_list.should be_empty      
      end
    end

    describe '#- operator' do
      it 'should remove the :admin role' do
        kris.add_roles(:admin, :blogger)
        expect { kris.roles - :admin }.to change{ kris.role_value }

        kris.has_role?(:blogger).should be_true      
        kris.has_role?(:admin).should be_false
      end
    end
    
    describe '#+ operator' do      
      it 'should add the :admin role' do
        expect { kris.roles + :admin }.to change{ kris.role_value }
        kris.has_role?(:admin).should be_true      
      end
    end

    describe '#<< operator' do
      it 'should add the :admin role' do
        kris.clear_roles!
        expect { kris.roles << :admin }.to change{ kris.role_value }
        kris.has_role?(:admin).should be_true      
      end
    end

    describe 'acts as Enumerable' do
      it 'should enable include?' do
        kris.clear_roles!
        expect { kris.roles << :admin }.to change{ kris.role_value }
        kris.roles.include?(:admin).should be_true      
      end
    end    
  end
end