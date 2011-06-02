# @author Kristian Mandrup
#
# @note all methods potentially operate directly on values in the data store
#
module Troles::Storage
  class RefMany < Generic
    def initialize role_subject
      super
    end

    def display_roles
      ds_field_value.map{|role| role.name.to_sym }
    end
    
    # saves the role for the user in the data store
    def set_roles *roles
      # finds and sets references to existing Role instances from symbols        
      set_ds_field find_roles(*roles)
    end  

    # clears the role of the user in the data store
    def clear!
      set_ds_field []
    end
    
    # clears the role of the user in the data store
    def set_default_role!
      clear!
    end                            
  end
end