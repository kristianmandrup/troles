class User
  include Mongoid::Document

  # has_and_belongs_to_many :troles, :class_name => 'Role'
  
  field :name
end

class Role
  include Mongoid::Document  

  # has_and_belongs_to_many :accounts, :class_name => 'User'
  field :name  
end

