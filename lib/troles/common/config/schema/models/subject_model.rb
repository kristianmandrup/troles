# 
# @author Kristian Mandrup
#
# Model configuration of the Subject model (fx Role)
# 
# Knows how to configure the relationship fro the Object model to the subject model via the Join model
#
module Troles::Common
  class Config
    module Schema
      class SubjectModel < BaseModel

        # the main field for the behavior to add, fx :troles for adding roles behavior
        attr_accessor :main_field

        # @param [Schema::Models] each model needs to have access to the collection of models it may need to create relations with
        # @param [Class] reference to the Class it aims to configure!
        # @param [Symbol] the name of the main field for the behavior to add, fx :troles for adding roles behavior
        def initialize models, clazz, main_field
          super models, clazz
          @main_field = main_field
        end

        # Used to set up a 'quick join' using Rails conventions and 'has_and_belongs_to_many' on the subject and object 
        def quick_join options = {}
          create_has_and_belongs_to_many :object
        end

        # Example:
        #   UserAccount (subject)        
        #     has_many :user_roles, :class_name => 'UserRole' (join)
        #     has_many :roles,      :class_name => 'Role', :through => :users_roles (subject)        
        def configure 
          super
          create_has_many_through :object, :key => main_field          
        end  

        # @note important to use super to avoid recursive stack overflow!                
        def through_options options = {}
          options.merge super(:object)
        end                       
      end
    end
  end
end