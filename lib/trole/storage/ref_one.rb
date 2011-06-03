#
# @author Kristian Mandrup
#
# Sngle role storage that stores a role as a Role instance reference
#
module Trole::Storage
  class RefOne < BaseOne        

    # constructor
    # @param [Symbol] the role subject
    def initialize role_subject
      super
    end

    # display the role as a list of one symbol
    # @return [Array<Symbol>] roles list
    def display_roles
      !ds_field_value.empty? ? [ds_field_value.flatten.first.name.to_sym] : []
    end
    

    # saves the role of the role subject in the data store
    # @param [Symbol] the role name
    def set_role role
      set_ds_field role_model.where(:name => role).first
    end  

    # sets the role to its default state
    def set_default_role!
      set_ds_field nil
    end  
  end
end