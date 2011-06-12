# 
# @author Kristian Mandrup
#
# Model configuration of the Join model (fx UsersRoles)
# 
# Knows how to configure the Join model between a subject model (the main target of the behavior fx UserAccount) and the object model (the behavior to be added, fx Role) 
#
module Troles::Common
  class Config
    module Schema
      class JoinModel < BaseModel

        # @param [Schema::Models] each model needs to have access to the collection of models it may need to create relations with
        # @param [Class] reference to the Class it aims to configure!
        def initialize models, clazz
          super
        end

        def simple_key
          clazz_name.to_s.underscore
        end

        def through_key
          make_key clazz_name
        end

        # The join model always belongs to both the object and subject model
        # the subject and object model can then each have a has_many relationship to the join model
        # thus creating a Many-to-Many relationship via the join model
        
        # Example:
        #   UsersRoles
        #     belongs_to :user, :class_name => 'UserAccount' (subject)             
        #     belongs_to :role, :class_name => 'Role' (object)
        #
        # @note Do not call super here! 
        def configure          
          create_belongs_to :subject, class_name_option(:subject)
          create_belongs_to :object, class_name_option(:object)
        end                
      end
    end
  end
end