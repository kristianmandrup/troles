#
# @author Kristian Mandrup
#
# Single role storage that stores role as an embedded Role instance
#
module Trole::Storage 
  class EmbedOne < BaseOne

    # constructor
    # @param [Symbol] the role subject
    def initialize api        
      super
    end

    # display the role as a list of one symbol
    # @return [Array<Symbol>] roles list
    def display_roles
      !ds_field_value.empty? ? [ds_field_value.first.name.to_sym] : []
    end

    # saves the role for the user in the data store
    def set_role role
      set_ds_field Role.create :name => role
    end  

    # sets the role to its default state  
    def set_default_role!
      set_ds_field []
    end          
  end      
end