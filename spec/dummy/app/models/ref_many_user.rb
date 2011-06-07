class RefManyUser < ActiveRecord::Base
  # has_and_belongs_to_many :troles, :class_name => 'Role'
  
  troles_strategy :ref_many do |c|
    c.valid_roles = [:user, :admin, :blogger, :editor]
  end.configure!
end