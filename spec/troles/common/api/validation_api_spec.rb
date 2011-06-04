shared_examples_for "Common Validation API" do
  describe '#check_valid_role?' do
    it 'should return valid role' do
      user.check_valid_role?(:admin).should == :admin
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
      user.send :make_valid_role, :admin
    end
  end

  # Ensures the role are valid
  # @param [Symbol] list of roles
  # @return [Array<Symbol>] the valid roles from the list of roles given
  describe '#make_valid_roles?' do
    it 'should return valid roles' do
      user.send :make_valid_roles, [:admin, :editor]
    end
  end

  # @return [Array<Symbol>] the valid roles of the role subject
  describe '#valid_roles' do
    it 'should get valid roles of class' do                   
      user.send(:valid_roles).should include(:admin)
    end
  end

  context 'Class Methods' do
    # @return [Array<Symbol>] the valid roles of the role subject
    describe '#valid_roles' do
      it 'should set not valid roles again!' do                   
        user.class.valid_roles.should include(:admin)
      end
    end
  end
end