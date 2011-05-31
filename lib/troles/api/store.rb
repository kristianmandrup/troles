module Troles::Api
  module Store
    # saves the role for the user in the data store
    def set_roles *new_roles
      strategy.clear!
      strategy.set_roles(make_valid_roles roles) 
      strategy.persist_role_changes!      
    end  

    # clears the role of the user in the data store
    def clear!
      strategy.clear!
      strategy.persist_role_changes!      
    end  

    protected

    def make_valid_roles *roles
      roles = roles.select_labels
      raise ArgumentError, "Roles must contain Symbols or Strings" if roles.empty?                
      check_valid_roles? roles.map{|r| r.to_s.alpha_numeric}
    end    
  end
end