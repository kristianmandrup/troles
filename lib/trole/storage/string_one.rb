#
# @author Kristian Mandrup
#
# Storage that stores role as a single String
#
module Trole::Storage
  class StringOne < BaseOne        

    # constructor
    # @param [Symbol] the role subject
    def initialize role_subject        
      super
    end

    # display the role as a list of one symbol
    # see Troles::Marshaller::Bitmask    
    # @return [Array<Symbol>] roles list
    # display the role as a list of one symbol
    # @return [Array<Symbol>] roles list
    def display_roles
      !ds_field_value.empty? ? [ds_field_value.to_sym] : []
    end

    # saves the roles for the role subject in the data store
    # see Troles::Marshaller::Bitmask
    # @param [Array<Symbol>] roles list        
    def set_roles *roles
      roles = roles.flatten
      raise ArgumentError, "For a single role strategy you can only set one role, was: #{roles.flatten}" if roles.empty? || (roles.size > 1)
      set_role roles.first
    end  

    # saves the role of the role subject in the data store
    # @param [Symbol] the role name
    def set_role role
      set_ds_field role.to_s
    end  

    # Clears the role state of the role subject 
    def clear!
      set_ds_field ""
    end
  end
end