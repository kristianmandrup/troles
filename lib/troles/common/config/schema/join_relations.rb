module Troles::Common
  class Config
    module Schema
      class JoinRelations < BaseRelations

        def initialize model
          super
        end
                
        def configure
          # UserRole (custom join class name)
          # belongs_to :user, :class_name => 'UserAccount'      
          belongs_to_for join_model, subject_class
          # belongs_to :role, :class_name => 'Role'      
          belongs_to_for join_model, object_class
        end
      end
    end
  end
end