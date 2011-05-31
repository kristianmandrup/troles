module Troles::Api
  module Read
    # perform any? on role_list
    def has_role? role
      role_list.include? role.to_sym
    end

    # role_list has one element which is role
    def is_role? role
      role_list.first == role.to_sym && role_list.size == 1
    end

    # subtraction of roles from role_list is empty
    def has_all_roles? *roles
      (roles.to_symbols - role_list).empty?
    end

    # union of roles and role_list is not empty
    def has_any_role? *roles
      !(role_list & roles.to_symbols).empty?
    end

    # return Set of symbols,where each symbol is a role name
    # This set should be cached and only invalidated when the user has a change of roles
    def role_list
      strategy.display_roles
    end
  end
end
