module Trole::Api
  module Read
    # perform any? on role_list
    def has_role? role
    end

    # role_list has one element which is role
    def is_role? role
    end
    
    # return Set of symbols,where each symbol is a role name
    # This set should be cached and only invalidated when the user has a change of roles
    def role_list  
      [:admin]
    end

    # the role as a Symbol
    def role_name
      role_list.first      
    end    
  end
end