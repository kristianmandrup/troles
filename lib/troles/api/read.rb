module Troles::Api
  module Read
    # perform any? on role_list
    def has_role? role
    end

    # role_list has one element which is role
    def is_role? role
    end

    # subtraction of roles from role_list is empty
    def has_all_roles? roles
    end

    # union of roles and role_list is not empty
    def has_any_role? roles
    end

    # return Set of symbols,where each symbol is a role name
    # This set should be cached and only invalidated when the user has a change of roles
    def role_list
      [:admin, :blogger]  
    end
  end
end
