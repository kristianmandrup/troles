require 'troles/common/marshaller'

#
# @author Kristian Mandrup
#
# Single role storage that stores role as a boolean value (false, true)
#
module Trole::Storage 
  class BitOne < BaseOne

    # constructor
    # @param [Symbol] the role subject
    def initialize role_subject
      super
    end

    # display the role as a list of one symbol
    # see Troles::Marshaller::Bitmask    
    # @return [Array<Symbol>] roles list
    def display_roles
      raise "BitOne requires exactly two valid roles, was: #{valid_roles}" if !(valid_roles.size == 2)
      [bitmask.read].flatten
    end
        
    # saves the role for the role subject in the data store
    # @param [Symbol] role name
    def set_role role
      num = bitmask.write role
      set_ds_field(num == 1 ? false : true) # boolean field in Data store
    end  

    # Clears the role state of the role subject 
    def clear!
      set_ds_field false
    end
    
    protected

    def bitmask
      @bitmask ||= Troles::Common::Marshaller::Bitmask.new role_subject
    end    
  end
end