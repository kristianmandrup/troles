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
    
    # saves the role for the user in the data store
    def set_roles *roles
      raise ArgumentError, "A single role strategy can only allow setting a single role, was: #{roles}" if (roles.size > 1)
      set_role roles.flat_uniq.first
    end  
    
    # saves the role for the role subject in the data store
    # @param [Symbol] role name
    def set_role role 
      num = bitmask.write role
      set_ds_field(num == 1 ? false : true) # boolean field in Data store
    end  

    # sets the role to its default state    
    def set_default_role!
      set_ds_field false
    end
    
    protected

    def bitmask
      @bitmask ||= Troles::Marshaller::Bitmask.new role_subject
    end    
  end
end