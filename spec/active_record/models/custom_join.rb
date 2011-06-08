require "active_record/migrations/many/custom_join"

class User < ActiveRecord::Base    
  # has_and_belongs_to_many :troles, :class_name => 'Role'
end

class Role < ActiveRecord::Base    
  # has_and_belongs_to_many :accounts, :class_name => 'User'
end 

class RolesUsersJoin < ActiveRecord::Base
end

