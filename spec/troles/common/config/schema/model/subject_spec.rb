require 'troles/common/config/schema/models_helper'

def subject_model_class
  Troles::Common::Config::Schema::SubjectModel
end

describe subject_model_class do
  let(:subject_model) do
    subject_model_class.new models, UserAccount, :troles
  end
  
  describe '#configure' do
    it 'should configure subject model' do
      subject_model.configure

      # check the logs!
      last_log  = subject_model.logs.last 
      first_log = subject_model.logs.first 

      matches_all first_log, 'has_many :user_roles', ':class_name=>"UsersRoles"'
      # has_many :roles, {:through=>:user_roles, :source=>:role, :class_name=>"Role", :foreign_key=>:account_id}
      matches_all last_log, 'UserAccount.has_many :troles', ':through=>:user_roles', ':source=>:role', ':class_name=>"Role"', ':foreign_key=>:account_id'
    end        
  end
end