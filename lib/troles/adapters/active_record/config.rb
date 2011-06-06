module Troles::ActiveRecord
  class Config < Troles::Common::Config  

    attr_accessor :role_join_model
    
    def initialize clazz, options = {}
      super 
    end
    
    def configure_relation
      case strategy
      when :ref_many
        return configure_join_model if role_join_model
        has_and_belongs_many clazz, role_model, :key => :accounts         
      when :embed_many
        raise "Embed many configuration not yet implemented for ActiveRecord" 
      end
    end

    # AR sets this up ont its own using DB Table info
    def configure_field
    end
    
    protected

    def join_key
      make_key role_join_model
    end
    
    def join_model
      # UserAccount
      # has_many :troles, :class_name => 'Role', :through => :users_roles
      has_many_for clazz, role_model, :through => join_key 
      # has_many :user_roles, :class_name => 'UserRole'
      has_many_for clazz, role_join_model, :key => join_key

      # UserRole (custom join class name)
      # belongs_to :user, :class_name => 'UserAccount'      
      belongs_to_for role_join_model, clazz
      # belongs_to :role, :class_name => 'Role'      
      belongs_to_for role_join_model, role_model

      # Role
      # has_many :accounts, :class_name => 'User', :through => :user_roles      
      has_many_for role, clazz, :through => join_key, :key => :accounts

      # has_many :user_roles, :class_name => 'UserRole'
      has_many_for role, role_join_model, :key => join_key      
    end
  end
end