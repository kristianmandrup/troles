module Trole
  module WriteOperations
    # add role
    def + role_to_add
      set_role(roles_to_add)
    end
    alias_method :<<, :+
    alias_method :add, :+

    # remove role
    def - role_to_remove
      clear! if contains? role_to_remove 
    end
    
    protected
    
    def set_role new_role
      clear!    
      store_role new_role
    end    
  end
end
