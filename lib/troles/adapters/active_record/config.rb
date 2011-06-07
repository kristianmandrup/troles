module Troles::ActiveRecord
  class Config < Troles::Common::Config  
    
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

    def role_join_model
      @join_model_found ||= begin
        models = [@join_model, 'UsersRoles'].select do |class_name|
          puts "try: #{class_name.to_s.camelize}"
          try_class(class_name.to_s.camelize)
        end.compact
        # puts "role models found: #{models}"
        raise "No #{clazz} to #{role_model} join class defined, define a #{clazz.to_s.pluralize}#{role_model.to_s.pluralize} model class or set which class to use, using the :role_join_model option on configuration" if models.empty?
        models.first.to_s.constantize
      end
    end

    def role_join_model= model_class
      @join_model = model_class and return if model_class.any_kind_of?(Class, String, Symbol)
      raise "The role model must be a Class, was: #{model_class}"
    end


    def join_key
      make_key role_join_model
    end
    
    def configure_join_model
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