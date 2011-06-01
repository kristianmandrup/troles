require 'trole/api/read'

module Troles::Api
  module Read
    include Trole::Api::Read::Shared

    # Checks if the role subject has any of the listed roles
    # @param [Array<Symbol>]
    # @return [Boolean]
    def has_all_roles? *roles
      (roles.to_symbols - role_list).empty?
    end

    # Checks if the role subject has any of the listed roles
    # @param (see #has_all_roles?)
    # @return (see #has_all_roles?)
    def has_any_role? *roles
      !(role_list & roles.to_symbols).empty?
    end
  end
end
