module Troles::Common
  class Config
    module Schema
      class SubjectRelations < BaseRelations

        def initialize model
          super          
        end

        def quick_join options = {}
          has_and_belongs_many subject_class, object_model
        end
        
        def configure 
          # UserAccount
          # has_many :troles, :class_name => 'Role', :through => :users_roles
          has_many_for subject_class, object_model, :key => role_field, :opts => {:through => join_key.to_sym}
          # has_many :user_roles, :class_name => 'UserRole'
          has_many_for subject_class, role_join_model, :key => join_key
        end
      end
    end
  end
end