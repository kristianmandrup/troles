module Troles::Common
  class Config
    module Schema
      def configure_role_field
        configure_generic
        configure_field if auto_config?(:fields)
        configure_relation if auto_config?(:relations)
      end         

      def configure_generic                    
        clazz.send(:attr_accessor, role_field)  if generic? || orm == :generic # create troles accessor      
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
        @role_model = model_class.to_s and return if model_class.any_kind_of?(Class, String, Symbol)
        raise "The role model must be a Class, was: #{model_class}"
      end

      # Gets the role model to be used
      # see (#role_model=)
      # @return [Class] the model class (defaults to Role)
      def role_model
        @role_model_found ||= begin
          models = [@role_model, 'Role'].select do |class_name|
            try_class(class_name.to_s.camelize)
          end.compact
          # puts "role models found: #{models}"
          raise "No Role class defined, define Role or set which class to use, using the :role_model option on configuration" if models.empty?
          models.first.to_s.constantize
        end
      end

      protected

      def try_class clazz
        begin
          clazz = clazz.constantize if clazz.kind_of?(String)
          clazz
        rescue          
          false
        end
      end
                     
      include SchemaHelpers
 end
  end
end