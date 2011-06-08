module Troles::ActiveRecord
  class Config < Troles::Common::Config  
    
    def initialize subject_class, options = {}
      super 
    end
    
    def configure_relation
      case strategy
      when :join_ref_many
        configure_join_model
      when :ref_many
        return configure_join_model if join_model
        has_and_belongs_many subject_class, object_model, :key => :accounts         
      when :embed_many
        raise "Embed many configuration not yet implemented for ActiveRecord" 
      end
    end

    # AR sets this up ont its own using DB Table info
    def configure_field
    end
    
    protected

    def object_model
      role_model
    end

    def join_model
      role_join_model
    end


    def role_join_model
      @join_model_found ||= begin
        models = [@join_model, join_model_best_guess].select do |class_name|
          try_class(class_name.to_s.camelize)
        end.compact
        # puts "role models found: #{models}"
        raise "No #{subject_class} to #{object_model} join class defined, define a #{join_model_best_guess} model class or set which class to use, using the :role_join_model option on configuration" if models.empty?
        models.first.to_s.constantize
      end
    end

    def join_model_best_guess
      "#{subject_class.to_s.pluralize}#{object_model.to_s.pluralize}"
    end

    def role_join_model= model_class
      @join_model = model_class and return if model_class.any_kind_of?(Class, String, Symbol)
      raise "The role model must be a Class, was: #{model_class}"
    end


    def join_key
      make_key role_join_model
    end
    
    def configure_join_model           
      if Troles::Common::Config.log_on?
        puts "configuring join model..." 
        puts "Subject class: #{subject_class}"
        puts "Role class: #{object_model}"
        puts "Join class: #{join_model}"
      end

      # UserAccount
      # has_many :troles, :class_name => 'Role', :through => :users_roles
      has_many_for subject_class, object_model, :through => join_key 
      # has_many :user_roles, :class_name => 'UserRole'
      has_many_for subject_class, role_join_model, :key => join_key

      # UserRole (custom join class name)
      # belongs_to :user, :class_name => 'UserAccount'      
      belongs_to_for role_join_model, subject_class
      # belongs_to :role, :class_name => 'Role'      
      belongs_to_for role_join_model, role_model

      # Role
      # has_many :accounts, :class_name => 'User', :through => :user_roles      
      has_many_for object_model, subject_class, :through => join_key, :key => :accounts

      # has_many :user_roles, :class_name => 'UserRole'
      has_many_for object_model, role_join_model, :key => join_key      
    end
  end
end