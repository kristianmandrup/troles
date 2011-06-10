module Troles::Common
  class Config
    module Schema
      class JoinModel < BaseModel

        def initialize models, clazz
          super
        end

        # def key
        #   my_class_name.underscore
        # end
                
        def configure
          # UserRole (custom join class name)
          # belongs_to :user, :class_name => 'UserAccount'      
          create_belongs_to :subject
          # belongs_to :role, :class_name => 'Role'      
          create_belongs_to :object
        end                
      end
    end
  end
end