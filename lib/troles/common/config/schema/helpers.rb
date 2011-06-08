module Troles::Common
  class Config
    module Schema
      module Helpers
        def valid_field_name? name
          return false if !name || name.empty?
          raise ArgumentException, "Role field must not be named role or roles as these names are reserved by troles!" if [:role, :roles].include? name.to_sym
          true
        end

        def boolean? value
          [true, false].include? value
        end


        def get_model_type class_name
          return :subject if class_name == subject_class
          return :object  if class_name == object_model
          return :join    if class_name == role_join_model
          raise "Not a known model: #{class_name}"
        end

        def key_options type, obj
          return {:prefix => 't'} if (type == :has_many && obj == :object) 
          {}
        end        
      end
    end
  end
end