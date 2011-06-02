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

    # saves the role of the role subject in the data store
    # @param [Symbol] the role name
    def set_role role
      set_ds_field role.to_s
    end  

    # sets the role to its default state
    def set_default_role!
      set_ds_field ""
    end  
  end
end