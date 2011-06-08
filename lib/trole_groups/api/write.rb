module TroleGroups::Api
  module Write
    # Add a single new rolegroup to the rolegroups of the subject
    # @param  [Symbol] rolegroup to add
    # @return (see #add_rolegroups)
    def add_rolegroup rolegroup_name
      raise ArgumentError, "Take a single rolegroup name, was: #{rolegroup_name}" if !rolegroup_name || !rolegroup_name.kind_of_label?
      add_rolegroups rolegroup_name
    end  

    # Remove a single rolegroup from the rolegroups of the subject
    # @param  [Symbol] rolegroup to remove
    # @return (see #remove_rolegroups)
    def remove_rolegroup rolegroup_name
      raise ArgumentError, "Take a single rolegroup name, was: #{rolegroup_name}" if !rolegroup_name || !rolegroup_name.kind_of_label?
      remove_rolegroups rolegroup_name
    end    

    # Adds a set of new rolegroups to the rolegroups of the subject
    # @param  [Array<Symbol>] list of rolegroups to add
    # @return [true, false, Error] true if ok, false if static or invalid, Error on some error
    def add_rolegroups *new_rolegroups      
      group_store.set_rolegroups (rolegroup_list | new_rolegroups.to_symbols_uniq) # Set Union (joined set)
    end  

    # Removes a set of new rolegroups to the rolegroups of the subject
    # (see #add_rolegroups)
    def remove_rolegroups *the_rolegroups
      group_store.set_rolegroups (rolegroup_list - the_rolegroups.to_symbols_uniq)
    end  

    # Sets new rolegroups for the subject
    # @param [Array<Symbol>] list of rolegroup names
    # @return [true, false, Error] true if set ok, false if any rolegroups were invalid, Error on some error 
    def set_rolegroups *rolegroups
      rolegroups_to_set = make_valid_rolegroups(*rolegroups).flat_uniq
      return false if !rolegroups_to_set || rolegroups_to_set.empty?
      group_store.set_rolegroups(rolegroups_to_set) 
    end  

    # Clears all the rolegroups of the subject
    # @return [true, false, Error] true if ok, false if rolegroups are static, Error on some error 
    def clear_rolegroups!
      group_store.clear!
    end  
  
    module ClassMethods
      # Sets which rolegroups are valid for the rolegroup subject class (fx User or UserAccount)
      #
      # @note this in effect limits what rolegroups can be assigned to any instance of the class
      #
      # @param [Array<Symbol>] list of rolegroup names
      def set_valid_rolegroups *rolegroups
        rolegroups = rolegroups.to_symbols_uniq
        raise ArgumentError, "Roles must contain Symbols or Strings" if rolegroups.empty?
        @valid_rolegroups = rolegroups
      end      
    end          
  end
end