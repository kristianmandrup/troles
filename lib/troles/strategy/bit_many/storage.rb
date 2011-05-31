module Troles::Strategy::BitMany
  class Storage < Troles::Storage::Generic
    def initialize api
      super
    end

    def display_roles
      bitmask.get_roles(ds_field)
    end
  
    # saves the role for the user in the data store
    def set_roles *roles
      set_ds_field bitmask.calc_bitmask(roles.to_symbols)
    end  

    # clears the role of the user in the data store
    def clear!
      set_default_role!
    end
  
    # clears the role of the user in the data store
    def set_default_role!
      set_ds_field 0
    end            

    protected

    def bitmask
      @bitmask ||= Troles::Calculator::Bitmask.new valid_roles
    end
  end
end