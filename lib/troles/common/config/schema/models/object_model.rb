# 
# @author Kristian Mandrup
#
# Model configuration of the Object model (fx Role)
# 
# Knows how to configure the relationship fro the Object model to the subject model via the Join model
#
module Troles::Common
  class Config
    module Schema
      class ObjectModel < BaseModel

        # @param [Schema::Models] each model needs to have access to the collection of models it may need to create relations with
        # @param [Class] reference to the Class it aims to configure!
        def initialize models, clazz
          super          
        end

        # Configures has_many through relationship via Join model for the object model (fx Role)
        #
        # Example:
        #   Role (object)
        #     has_many :accounts,   :class_name => 'RefManyAccount', :through => :accounts_roles (subject)
        #     has_many :user_roles, :class_name => 'UserRole' (join)
        def configure         
          create_has_many_through :subject
          create_has_many :join
        end

        # @note important to use super to avoid recursive stack overflow!
        def through_options options = {}
          options.merge super(:subject)
        end           
      end
    end
  end
end