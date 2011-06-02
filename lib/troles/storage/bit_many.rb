# @author Kristian Mandrup
#
# @note all methods potentially operate directly on values in the data store
#
module Troles::Storage
  class BitMany < Generic
    def initialize role_subject
      super
    end

    def display_roles
      bitmask.read
    end
  
    # saves the role for the user 
    def set_roles *roles
      roles = roles.to_symbols_uniq
      return clear! if roles.empty?      
      set_ds_field bitmask.write(roles.to_symbols)
    end  

    # Clears the role set of the role subject 
    def clear!
      set_ds_field 0
    end
  
    # Sets to default role set    
    def set_default_role!
      clear!
    end            

    protected

    def bitmask
      @bitmask ||= Troles::Marshaller::Bitmask.new role_subject
    end
  end
end