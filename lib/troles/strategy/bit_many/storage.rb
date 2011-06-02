module Troles::Strategy::BitMany
  class Storage < Troles::Storage::Generic
    def initialize role_subject
      super
    end

    def display_roles
      bitmask.read
    end
  
    # saves the role for the user in the data store
    def set_roles *roles
      roles = roles.to_symbols_uniq
      return clear! if roles.empty?      
      set_ds_field bitmask.write(roles.to_symbols)
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
      @bitmask ||= Troles::Marshaller::Bitmask.new role_subject
    end
  end
end