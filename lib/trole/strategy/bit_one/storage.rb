module Trole::Strategy::BitOne # boolean flag
  class Storage < Trole::Storage::Generic
    def initialize role_subject
      super
    end

    def display_roles
      raise "BitOne requires exactly two valid roles, was: #{valid_roles}" if !(valid_roles.size == 2)
      [bitmask.read].flatten
    end
    
    # saves the role for the user in the data store
    def set_roles *roles
      raise ArgumentError, "A single role strategy can only allow setting a single role, was: #{roles}" if (roles.size > 1)
      set_role roles.flat_uniq.first
    end  
    
    # saves the role for the user in the data store
    def set_role role 
      num = bitmask.write role
      set_ds_field(num == 1 ? false : true) # boolean field in Data store
    end  
    
    def set_default_role!
      set_ds_field false
    end
    
    protected

    def bitmask
      @bitmask ||= Troles::Marshaller::Bitmask.new role_subject
    end    
  end
end