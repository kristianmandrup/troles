class User < ActiveRecord::Base    
  has_one :role
end

class Role < ActiveRecord::Base    
  belongs_to :user    
end

