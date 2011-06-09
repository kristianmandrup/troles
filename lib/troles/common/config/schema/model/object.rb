module Troles::Common
  class Config
    module Schema
      class ObjectModel < BaseModel

        def initialize models, clazz
          super          
        end

        def configure         
          # Role (object)
          # Role.has_many :accounts, :class_name => 'RefManyAccount', :through => :accounts_roles      
          create_has_many_through :subject
          # has_many :user_roles, :class_name => 'UserRole'
          create_has_many :join
        end
                        
        def through_options options = {}
          options.merge through_options(:subject)
        end           
      end
    end
  end
end