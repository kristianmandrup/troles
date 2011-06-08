module TroleGroups::Storage
  class RefMany < BaseMany
    def initialize rolegroup_subject
      super
    end

    def display_roles
      display_roles_for rolegroup_list
    end

    def display_roles_for *names
      groups = find_rolegroups names.to_symbols_uniq
      groups.inject([]) {|res, group| res << group.roles }.flat_uniq
    end

    # display the roles as a list of symbols
    # @return [Array<Symbol>] roles list
    def display_rolegroups
      return [] if !ds_field_value?
      ds_field_value.flatten.map do |rolegroup| 
        rolegroup.name.to_sym 
      end
    end

    # is it set?
    def ds_field_value?
      ds_field_value && !ds_field_value.empty?
    end      
    
    # saves the role for the user in the data store
    def set_rolegroups *rolegroups
      # finds and sets references to existing Role instances from symbols
      found = find_rolegroups(*rolegroups)
      set_ds_field found
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