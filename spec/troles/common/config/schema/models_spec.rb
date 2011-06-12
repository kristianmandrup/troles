require 'troles/common/config/schema/models_helper'

describe models_class do
  let(:models) do
    # subject, object, join
    models_class.new UserAccount, Role, UsersRoles, :subject_key => :troles
  end

  describe '#configure' do
    it 'should configure all models' do
      models.configure      
      
      logs_matches(models.logs, 'UserAccount.has_many :troles').should
    end
  end
end