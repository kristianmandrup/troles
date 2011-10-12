require "active_record/migrations/one/ref_one"

class User < ActiveRecord::Base
  # belongs_to :trole, :class_name => 'Role'
end

class Role < ActiveRecord::Base
  # has_many :users, :class_name => 'User'
end

