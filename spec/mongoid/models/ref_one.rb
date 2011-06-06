class User
  include Mongoid::Document

  belongs_to :trole, :class_name => 'Role'
  
  field :name  
end

class Role
  include Mongoid::Document  

  has_many :users, :class_name => 'User'
  
  field :name  
end
