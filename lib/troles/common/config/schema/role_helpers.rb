module Troles::Common
  class Config
    module Schema
      module RoleHelpers
        def subject_class_name
          subject_class.to_s
        end

        def subject_key options = {}
          make_key subject_class_name, options
        end

        def join_class_name
          role_join_model.to_s
        end

        def join_key options = {}
          make_key join_class_name, options
        end

        def object_class_name
          object_model.to_s
        end
      end
    end
  end
end