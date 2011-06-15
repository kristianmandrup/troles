# 
# @author Kristian Mandrup
#
# Schema configuration
# Has responsibiloity to configure relationships between models
#
module Behave
  class Config
    module Schema
      autoload :Helpers,        'behave/config/schema/helpers'

      # configures the models if set to do so
      # first configures 
      def configure_models
        configure_generic if generic?
        configure_field if auto_config?(:fields)
        configure_relation if auto_config?(:relations)
      end         

      # configures main field (fx role field) as a generic accessor
      def configure_generic
        raise "Subject class must be a Class" unless subject_class.is_a?(Class)
        subject_class.send(:attr_accessor, main_field) # create troles accessor      
      end

      # configures a single main field on the subject
      # fx if the roles are stored as a Boolean, Integer or String
      # @note adapter should customize this as needed 
      def configure_field
      end

      # configures model relationships for roles
      # fx if the roles are stored in an model, either embedded or referenced 
      # @note adapter should customize this as needed 
      def configure_relation
      end

      # Sets the object model to use
      # allows different subject classes (fx User Accounts) to have different schemas
      # @param [Class, String, Symbol] the model class
      def object_model= model_class
        @object_model = model_class.to_s and return if model_class.any_kind_of?(Class, String, Symbol)
        raise "The object model must be a Class, was: #{model_class}"
      end
      alias_method :role_mode=, :object_model=

      # Gets the object model to be used
      # see (#object_model=)
      # see(#default_object_model_class_name)
      #
      # @return [Class] the model class
      def object_model
        @object_model_found ||= find_first_class(@object_model, default_object_model_class_name)
      end
      alias_method :role_mode, :object_model

      protected

      def default_object_model_class_name
        'Role'
      end

      # from sugar-high gem
      include ClassExt
                     
      include Helpers # ??
    end
  end
end