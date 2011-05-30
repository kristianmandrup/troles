module Troles
  module WriteOperations
    # add role
    def + roles_to_add
      set_roles(roles + roles_to_add)
    end
    alias_method :<<, :+
    alias_method :add, :+

    # remove roles
    def - roles_to_remove
      set_roles(roles - roles_to_add)
    end
    
    protected
    
    def set_roles new_roles
      clear!    
      store_roles new_roles
    end
  end
end
