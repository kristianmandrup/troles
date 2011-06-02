# @author Kristian Mandrup
#
# @note all methods should operate on the data store via the #store
#
module Trole::Api
  module Write
    def role= new_role
      store.set_role new_role
    end    
    
    # Set the role of the subject to a new role
    # @param  [Symbol] the role to set
    # @return [true, false, Error] true if ok, false if not valid, Error on some error
    def set_role new_role
      value = make_valid_role new_role 
      return false if !value
      store.set_role(value)      
    end  
    
    # Clears the role of the user
    # @return (see #set_role)
    def clear_role!
      store.clear!
    end    
  end
end