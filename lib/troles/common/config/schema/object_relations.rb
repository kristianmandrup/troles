module Troles::Common
  class Config
    module Schema
      class ObjectRelations < BaseRelations

        def initialize model
          super          
        end

        def configure         
          # Role
          # has_many :accounts, :class_name => 'User', :through => :user_roles      
          has_many_for object_model, subject_class, :key => :accounts, :opts => {:through => join_key.to_sym}

          # has_many :user_roles, :class_name => 'UserRole'
          has_many_for object_model, role_join_model, :key => join_key      
        end
      end
    end
  end
end