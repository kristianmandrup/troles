require "active_record/migrations/one/ref_one"

class User < ActiveRecord::Base    
  has_one :trole, :class_name => 'Role'
end

class Role < ActiveRecord::Base    
  belongs_to :user, :class_name => 'User'
end

