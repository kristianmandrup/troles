require 'spec_helper'

class UsersRoles < ActiveRecord::Base  
end

def join_model_class
  Troles::Common::Config::Schema::JoinModel
end

describe join_model_class do
  let(:join_model) do
    join_model_class.new models, 'UsersRoles'
  end
  
  describe '#configure' do
    join_model.configure
  end
end