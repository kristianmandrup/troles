# API for the data store
module Trole
  module StoreApi
    # saves the role for the user in the data store
    def set_role role
      check_role! role
    end  

    # clears the role of the user in the data store
    def clear!
    end 
    
    protected

    def valid_role role
      raise ArgumentError, "Role to set must be a Symbol or String" if !role.kind_of_label?
      check_valid_role? role.to_s.alpha_numeric
    end     
  end
end