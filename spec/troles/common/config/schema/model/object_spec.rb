require 'troles/common/config/schema/models_helper'

def object_model_class
  Troles::Common::Config::Schema::ObjectModel
end

describe object_model_class do
  let(:object_model) do
    object_model_class.new models, Role
  end
  
  describe '#configure' do
    it 'should configure object model' do
      object_model.configure

      # check the logs!
      last_log  = object_model.logs.last 
      first_log = object_model.logs.first 

      matches_all first_log, 'has_many :user_roles', ':class_name=>"UsersRoles"'
      matches_all last_log, 'Role.has_many :user_accounts', ':through=>:user_roles', ':source=>:user_account', ':class_name=>"UserAccount"'
    end        
  end
end