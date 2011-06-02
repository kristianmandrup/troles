module Troles::Api
  module Store
    # saves the role for the user in the data store
    def set_roles *roles
      strategy.set_roles(make_valid_roles *roles) 
    end  

    # clears the role of the user in the data store
    def clear_roles!
      strategy.clear!
    end  

    protected

    def make_valid_roles *roles      
      roles = roles.to_symbols_uniq
      return [] if roles.empty?                
      check_valid_roles? roles.map{|r| r.to_s.alpha_numeric}
    end    
  end
end