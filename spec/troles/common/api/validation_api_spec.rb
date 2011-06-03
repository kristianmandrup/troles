shared_examples_for "Common Validation API" do
  describe '#check_valid_role?' do
    it 'should return valid role' do
      user.check_valid_role?(:admin).should include(:admin)
    end
  end

  # @return [Array<Symbol>] returns the valid roles or empty list if no valid roles
  describe '#check_valid_roles?' do
    it 'should return valid roles' do
      user.check_valid_roles?(:admin, :editor).should include(:admin)
    end
  end

  # @return [Symbol, false, Error] a valid role name, false if invalid, or Error on some error    
  describe '#make_valid_role?' do
    it 'should return valid role' do
      user.make_valid_role? :admin
    end
  end

  # Ensures the role are valid
  # @param [Symbol] list of roles
  # @return [Array<Symbol>] the valid roles from the list of roles given
  describe '#make_valid_roles?' do
    it 'should return valid roles' do
      user.make_valid_roles? :admin, :editor
    end
  end

  # @return [Array<Symbol>] the valid roles of the role subject
  describe '#valid_roles' do
    it 'should get valid roles of class' do                   
      user.valid_role.should include(:admin)
    end
  end

  context 'Class Methods' do
    # @return [Array<Symbol>] the valid roles of the role subject
    describe '#valid_roles=' do
      it 'should set valid roles' do                   
        expect { user.class.valid_roles = :admin, :editor }.to change{ user.class.instance_variable_get "@valid_roles" }
      end
    end
  end
end