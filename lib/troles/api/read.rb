require 'trole/api/read'

module Troles::Api
  module Read
    include Trole::Api::Read::Shared

    # subtraction of roles from role_list is empty
    def has_all_roles? *roles
      (roles.to_symbols - role_list).empty?
    end

    # union of roles and role_list is not empty
    def has_any_role? *roles
      !(role_list & roles.to_symbols).empty?
    end
  end
end
