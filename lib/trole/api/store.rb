module Trole::Api
  module Store
    # saves the role for the user in the data store
    # must user strategy to handle it
    def set_role new_role
      value = make_valid_role new_role 
      return false if !value
      strategy.set_role(value)      
    end  
    
    def set_roles *roles
      roles = roles.to_symbols_uniq
      raise ArgumentError, "A single role strategy can only set one role" if (roles.size > 1)
      set_role roles.first
    end
    
    # clears the role of the user in the data store
    # must user strategy to handle it
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