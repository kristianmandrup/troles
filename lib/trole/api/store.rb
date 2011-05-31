# API for the data store
module Trole::Api
  module Store
    # saves the role for the user in the data store
    def set_role role
      strategy.set_role(make_valid_role role) 
      strategy.persist_role_changes!      
    end  

    # clears the role of the user in the data store
    def clear!
      strategy.clear!
      strategy.persist_role_changes!
    end 

    def strategy
      Trole::Strategy::BaseOne
    end
    
    protected

    def make_valid_role role
      raise ArgumentError, "Role to set must be a Symbol or String" if !role.kind_of_label?
      check_valid_role? role.to_s.alpha_numeric
    end     
  end
end