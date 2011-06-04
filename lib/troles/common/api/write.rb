# @author Kristian Mandrup
#
# @note all methods should operate on the data store via the #store
#
module Troles::Common::Api
  module Write
        
    # Add a single new role to the roles of the subject
    # @param  [Symbol] role to add
    # @return (see #add_roles)
    def add_role new_role
      add_roles new_role
    end  

    # Remove a single role from the roles of the subject
    # @param  [Symbol] role to remove
    # @return (see #remove_roles)
    def remove_role a_role
      remove_roles a_role
    end    

    # Adds a set of new roles to the roles of the subject
    # @param  [Array<Symbol>] list of roles to add
    # @return [true, false, Error] true if ok, false if static or invalid, Error on some error
    def add_roles *new_roles      
      store.set_roles (role_list | new_roles.to_symbols_uniq) # Set Union (joined set)
    end  

    # Removes a set of new roles to the roles of the subject
    # (see #add_roles)
    def remove_roles *the_roles
      store.set_roles (roles - the_roles.to_symbols_uniq)
    end  

    # Sets new roles for the subject
    # @param [Array<Symbol>] list of role names
    # @return [true, false, Error] true if set ok, false if any roles were invalid, Error on some error 
    def set_roles *roles
      store.set_roles(make_valid_roles *roles) 
    end  

    # Clears all the roles of the subject
    # @return [true, false, Error] true if ok, false if roles are static, Error on some error 
    def clear_roles!
      store.clear!
    end  
    
    module ClassMethods
      # Sets which roles are valid for the role subject class (fx User or UserAccount)
      #
      # @note this in effect limits what roles can be assigned to any instance of the class
      #
      # @param [Array<Symbol>] list of role names
      def set_valid_roles *roles
        roles = roles.to_symbols_uniq
        raise ArgumentError, "Roles must contain Symbols or Strings" if roles.empty?
        @valid_roles = roles
      end      
    end          
  end
end