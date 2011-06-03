#
# @author Kristian Mandrup
#
# Core Troles API functions
#
module Troles::Common::Api
  module Core
    # Access to the Troles operations API
    # @return [Troles::Operations] the operations API object 
    def roles
      @roles ||= Troles::Operations.new(self)
    end       

    # Sets the roles of the subject
    # (see #set_roles)
    def roles= *new_roles
      roles.set_roles new_roles
    end       

    # If this role subject instance should have static (immutable) roles
    # @return [true, false] defaults to false so a role subject is allowed to change roles 
    def static_roles?
      return self.class.static_roles? if self.class.respond_to? :static_roles?
      false
    end
        
    module ClassMethods      
      attr_accessor :valid_roles
      attr_accessor :role_model

      # Sets the role model to use
      # allows different role subject classes (fx User Accounts) to have different role schemas
      # @param [Class] the model class
      def role_model= model_class
        @role_model = model_class and return if model_class.kind_of?(Class)
        raise "The role model must be a Class, was: #{model_class}"
      end

      # Gets the role model to be used
      # see (#role_model=)
      # @return [Class] the model class (defaults to Role)
      def role_model
        return @role_model if @role_model && defined? @role_model
        return Role if defined? Role
        raise "Troles could not figure out what Role model to use, please define a class Role or set the #role_model class method to point to a model of your choice!"
      end

      # If all role subjects using this strategy should have static (immutable) roles
      # @return [true, false] if role subjects have static roles or not (default: false)
      def static_roles?
        false
      end           
    end
  end
end