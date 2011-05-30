module Troles
  module StoreApi
    # saves the role for the user in the data store
    def set_roles *new_roles
      clear!
      # add
    end  

    # clears the role of the user in the data store
    def clear!
      # ...
    end  

    protected

    def valid_roles *roles
      roles = roles.select_labels
      raise ArgumentError, "Roles must contain Symbols or Strings" if roles.empty?                
      check_valid_roles? roles.map{|r| r.to_s.alpha_numeric}
    end    
  end
end