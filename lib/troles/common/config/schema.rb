module Troles::Common
  class Config
    module Schema
      autoload :Helpers,        'troles/common/config/schema/helpers'

      autoload :Models,         'troles/common/config/schema/models'
      autoload :BaseModel,      'troles/common/config/schema/models/base_model'
      autoload :SubjectModel,   'troles/common/config/schema/models/subject_model'
      autoload :ObjectModel,    'troles/common/config/schema/models/object_model'
      autoload :JoinModel,      'troles/common/config/schema/models/join_model'
      
      def configure_models
        configure_generic
        configure_field if auto_config?(:fields)
        configure_relation if auto_config?(:relations)
      end         

      def configure_generic                    
        subject_class.send(:attr_accessor, role_field)  if generic? || orm == :generic # create troles accessor      
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
        @role_model_found ||= find_first_class(role_model, default_role_class_name)
      end

      protected

      def default_role_class_name
        'Role'
      end

      # from sugar-high gem
      include ClassExt
                     
      include Helpers
    end
  end
end