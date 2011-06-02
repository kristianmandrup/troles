module Trole::Api
  module Store
    # saves the role for the user in the data store
    def set_role role
      strategy.set_role(make_valid_role role)
    end  
    
    def set_roles *roles                                                 
      roles = roles.to_symbols_uniq
      raise ArgumentError, "A single role strategy can only set one role" if (roles.size > 1)
      set_role roles.first
    end
    
    # clears the role of the user in the data store
    def clear_role!
      strategy.clear!
    end 
    alias_method :clear_roles!, :clear_role!
    
    protected
    
    def make_valid_role role
      raise ArgumentError, "Role to set must be a Symbol or String" if !role.kind_of_label?
      check_valid_role? role.to_s.alpha_numeric
    end
  end
end