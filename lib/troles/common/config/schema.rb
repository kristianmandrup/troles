module Troles::Common
  class Config
    module Schema
      attr_accessor :join_model, :role_field

      def configure_role_field
        configure_field
        configure_relation
      end         

      # Adapter should customize this as needed 
      def configure_field
      end

      # Adapter should customize this as needed 
      def configure_relation
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

      def role_field            
        return nil if !singularity && !@role_field
        @role_field ||= begin
          singularity == :many ? :troles : :trole
        end
      end 

      def role_field= field_name
        name = field_name.to_s.alpha_numeric.to_sym
        raise ArgumentException, "Not a valid role field name: #{field_name}"  if !valid_field_name?(name)
        @role_field ||= name
      end

      def configure_role_field options = {}
        clazz.send(:attr_accessor, role_field) if generic? || orm == :generic # create troles accessor      
      end       

      protected
                     
      include SchemaHelpers
 end
  end
end