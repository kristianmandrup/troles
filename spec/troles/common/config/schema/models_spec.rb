require 'spec_helper'

class UserAccount < ActiveRecord::Base  
end

class Role < ActiveRecord::Base  
end

class UsersRoles < ActiveRecord::Base  
end

def join_class
  UsersRoles
end

def object_class
  Role
end

def subject_class
  UserAccount
end


def models_class
  Troles::Common::Config::Schema::Models
end

describe subject_model_class do
  let(:models) do
    models_class.new subject_class, object_class, join_class
  end
  
  describe '#configure' do
    models.configure
  end
end