module Troles::Common
  class Config
    module Schema
      module RoleHelpers
        def subject_class_name
          subject_class.to_s
        end

        def subject_key
          make_key subject_class_name
        end

        def join_class_name
          join_model.to_s
        end

        def join_key
          make_key join_class_name
        end

        def object_class_name
          object_model.to_s
        end
      end
    end
  end
end