module Behave
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
      end
    end
  end
end