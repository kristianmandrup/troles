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
      return [] if !ds_field_value?
      [ds_field_value.name.to_sym]
    end    

    # is it set?
    def ds_field_value?
      ds_field_value
    end      

    # saves the role of the role subject in the data store
    # @param [Symbol] the role name
    def set_role role
      role_to_set = role_model.where(:name => role).first
      set_ds_field role_to_set
    end  

    # Clears the role state of the role subject 
    def clear!
      set_ds_field nil
    end
  end
end