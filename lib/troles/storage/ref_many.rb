# @author Kristian Mandrup
# 
# Many role storage for storing multiple Role references on the role subject
#
# @note all methods potentially operate directly on values in the data store
#
module Troles::Storage
  class RefMany < BaseMany
    def initialize role_subject
      super
    end

    # display the roles as a list of symbols
    # @return [Array<Symbol>] roles list
    def display_roles
      super
      ds_field_value.flatten.map do |role| 
        role.name.to_sym 
      end
    end

    # is it set?
    def ds_field_value?
      ds_field_value && !ds_field_value.empty?
    end      
    
    # saves the role for the user in the data store
    def set_roles *roles
      # finds and sets references to existing Role instances from symbols        
      found_roles = find_roles(*roles)
      set_ds_field found_roles
    end  

    # clears the role of the user in the data store
    def clear!
      set_ds_field []
    end
    
    # sets the role to default setting
    def set_default_role!
      clear!
    end                            
  end
end