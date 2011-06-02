module Trole::Strategy::BitOne # boolean flag
  class Storage < Trole::Storage::Generic
    def initialize role_subject
      super
    end

    def persist_role_changes!
      role_subject.save!
      role_subject.publish_change :roles
    end

    def display_roles
      raise "BitOne requires exactly two valid roles, was: #{valid_roles}" if !(valid_roles.size == 2)
      value = !ds_field_value ? valid_roles[0] : valid_roles[1]
      [value]
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
      persist_role_changes!
    end  
    
    def set_default_role!
      set_ds_field false
      persist_role_changes!
    end
    
    protected

    def bitmask
      @bitmask ||= Troles::Marshaller::Bitmask.new role_subject
    end    
  end
end