module Troles::Common::Api
  module Validation
    def check_valid_role? role
      return role if valid_roles.include? role.to_sym
      false
    end
    
    def check_valid_roles? *roles
      roles = valid_roles & roles.to_symbols
      return roles if !roles.empty? 
      false
    end
    
    protected

    # Ensures the role is valid
    # @return [Symbol, false, Error] a valid role name, false if invalid, or Error on some error
    def make_valid_role role
      raise ArgumentError, "Role to set must be a Symbol or String" if !role.kind_of_label?
      check_valid_role? role.to_s.alpha_numeric
    end

    def make_valid_roles *roles      
      roles = roles.to_symbols_uniq
      return [] if roles.empty?                
      check_valid_roles? roles.map{|r| r.to_s.alpha_numeric}
    end
    
    def valid_roles
      self.class.valid_roles
    end
  end
end