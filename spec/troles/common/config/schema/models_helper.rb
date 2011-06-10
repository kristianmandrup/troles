require 'rspec'
require 'require_all'
require 'active_record'
require 'troles_spec'

Troles::Common::Config.log_on = true

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


def models
  @models ||= models_class.new subject_class, object_class, join_class, :subject_key => :troles
end
