module Troles::Api
  module Store
    # saves the role for the user in the data store
    def set_roles *new_roles
      # clear_roles!       
      roles_to_set = make_valid_roles *new_roles
      raise ArgumentError, "None of the roles are valid, was: #{new_roles}, valid roles are: #{self.class.valid_roles}" if !roles_to_set || roles_to_set.empty?
      strategy.set_roles(roles_to_set) 
    end  

    # clears the role of the user in the data store
    def clear_roles!
      strategy.clear!
    end  

    protected

    def make_valid_roles *roles
      roles = roles.select_labels
      raise ArgumentError, "Roles must contain Symbols or Strings" if roles.empty?                
      check_valid_roles? roles.map{|r| r.to_s.alpha_numeric}
    end    
  end
end