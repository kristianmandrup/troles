module Troles::Api
  module Store
    # saves the role for the user in the data store
    def set_roles *new_roles
      roles_to_set = make_valid_roles *new_roles      
      strategy.set_roles(roles_to_set) 
    end  

    # clears the role of the user in the data store
    def clear_roles!
      strategy.clear!
    end  

    protected

    def make_valid_roles *roles      
      roles = roles.flat_uniq.select_labels
      return [] if roles.empty?                
      check_valid_roles? roles.map{|r| r.to_s.alpha_numeric}
    end    
  end
end