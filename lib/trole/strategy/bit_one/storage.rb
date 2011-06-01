module Trole::Strategy::BitOne # boolean flag
  class Storage < Trole::Storage::Generic
    def initialize api        
      super
    end

    def display_roles
      raise "BitOne requires exactly two valid roles, was: #{valid_roles}" if !(valid_roles.size == 2)
      value = !ds_field_value ? valid_roles[0] : valid_roles[1]
      [value]
    end
    
    # saves the role for the user in the data store
    def set_roles *roles
      set_ds_field bitmask.calc_bitmask(roles)
    end  
    
    # saves the role for the user in the data store
    def set_role role
      set_ds_field(role ? true : false) # boolean field in Data store
    end  
    
    def set_default_role!
      set_ds_field false
    end
  end
end