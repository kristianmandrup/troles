module TroleGroups
  class Config
    module Schema
      module RoleGroupHelpers
        def rolegroup_class_name
          rolegroup_model.to_s
        end
      end
    end
  end
end