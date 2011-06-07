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
        if generic? || orm == :generic # create troles accessor      
          puts "set generic #{role_field}"
          clazz.send(:attr_accessor, role_field) 
        else
          puts "not generic: #{generic?} #{orm}"
        end
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
        @role_model = model_class.to_s and return if model_class.any_kind_of?(Class, String, Symbol)
        raise "The role model must be a Class, was: #{model_class}"
      end

      # Gets the role model to be used
      # see (#role_model=)
      # @return [Class] the model class (defaults to Role)
      def role_model
        @role_model_found ||= begin
          models = [@role_model, 'Role'].select do |class_name|
            try_class(class_name.to_s)
          end.compact
          # puts "role models found: #{models}"
          raise "No Role class defined, define Role one or set using #role_model method on config" if models.empty?
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