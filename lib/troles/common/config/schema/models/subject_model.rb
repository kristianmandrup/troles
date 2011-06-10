module Troles::Common
  class Config
    module Schema
      class SubjectModel < BaseModel

        attr_accessor :main_field

        def initialize models, clazz, main_field
          super models, clazz
          @main_field = main_field
        end

        # def my_class
        #   subject_class
        # end

        def quick_join options = {}
          create_has_and_belongs_to_many :object
        end
        
        def configure 
          # UserAccount
          create_has_many_through :key => main_field 
          # has_many :user_roles, :class_name => 'UserRole'
          create_has_many :object
        end  

        # UserAccount.belongs_to :role, :class_name => 'Role'
        # def create_belongs_to options = {}
        #   make_relationship :belongs_to, object, options
        # end

          # has_many :troles, :class_name => 'Role', :through => :user_roles
                
        def through_options options = {}
          options.merge through_options(:object)
        end                       
      end
    end
  end
end