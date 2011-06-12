require 'troles/common/config/schema/models_helper'

class UsersRoles < ActiveRecord::Base  
end

def join_model_class
  Troles::Common::Config::Schema::JoinModel
end

describe join_model_class do
  let(:join_model) do
    join_model_class.new models, UsersRoles
  end
  
  describe '#configure' do
    it 'should configure join model' do
      join_model.configure

      # check the logs!
      last_log  = join_model.logs.last 
      first_log = join_model.logs.first 

      matches_all first_log, 'belongs_to :user_account', ':class_name=>"UserAccount"'
      matches_all last_log, 'belongs_to :role', ':class_name=>"Role"'
    end
  end
end