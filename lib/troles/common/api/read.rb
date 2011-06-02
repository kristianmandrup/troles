# @author Kristian Mandrup
#
# Common Read API
#
require 'set'

module Troles::Common::Api
  module Read

    # Ensures that the common API methods always have a common underlying model to work on
    # @note This Set should be cached and only invalidated when the user has a change of roles    
    # @return Array<Symbol> Set of role names
    def role_list        
      @role_list ||= begin
        Set.new strategy.display_roles
      end
    end
        
    # Does the role subject has the role or not?
    # @return [true, false]
    def has_role? role
      role_list.include? role.to_sym
    end

    # Does the role subject have ONLY that role or not?
    # @return [true, false]
    def is_role? role
      role_list.first == role.to_sym && role_list.size == 1
    end
    
    # Checks if the role subject has any of the listed roles
    # @param [Array<Symbol>]
    # @return [true, false]
    def has_all_roles? *roles
      (roles.to_symbols - role_list).empty?
    end

    # Checks if the role subject has any of the listed roles
    # (see #has_all_roles?)
    def has_any_role? *roles
      !(role_list & roles.to_symbols).empty?
    end    
  end
end