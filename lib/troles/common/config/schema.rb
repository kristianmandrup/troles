module Troles::Common
  class Config
    module Schema
      attr_accessor :join_model

      def configure_role_field
        configure_generic
        configure_field
        configure_relation
      end         

      def configure_generic
        clazz.send(:attr_accessor, role_field) if generic? || orm == :generic # create troles accessor      
      end       


      # Adapter should customize this as needed 
      def configure_field
      end

      # Adapter should customize this as needed 
      def configure_relation
      end

      def join_model
        @join_model ||= begin
          return UsersRoles if defined? UsersRoles
          raise "Join model not defined"
        end
      end

      def join_model= model_class
        @join_model = model_class and return if model_class.kind_of?(Class)
        raise "The role model must be a Class, was: #{model_class}"
      end

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

      protected
                     
      include SchemaHelpers
 end
  end
end