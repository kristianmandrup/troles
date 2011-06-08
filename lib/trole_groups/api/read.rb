module TroleGroups::Api
  module Read
    def roles_from_rolegroups
      group_store.display_roles
    end
    
    def roles_for *names
      group_store.display_roles_for *names
    end
    
    # any? on rolegroups_list
    def in_rolegroup? rolegroup
      rolegroup_list.include? rolegroup.to_sym
    end
    alias_method :has_rolegroup?, :in_rolegroup?

    # rolegroup_list has one element which is rolegroup
    def only_in_rolegroup? rolegroup
      rolegroup_list.first == rolegroup.to_sym && rolegroup_list.size == 1      
    end

    # subtraction of role_groups from rolegroups_list is empty
    def in_rolegroups? *rolegroups
      (rolegroups.to_symbols - rolegroup_list).empty?
    end
    alias_method :has_rolegroups?, :in_rolegroups?

    # union of rolegroups and rolegroups_list is not empty
    def in_any_rolegroup? *rolegroups
      !(rolegroup_list & rolegroups.to_symbols).empty?
    end
    alias_method :has_any_rolegroup?, :in_any_rolegroup?

    # return roles of that rolegroup
    def roles_of rolegroup
      raise "Pending"
    end

    # return Set of symbols,where each symbol is a rolegroup name
    # This set should be cached and only invalidated when the user has a change of roles
    def rolegroup_list
      @rolegroup_list ||= begin
        group_store.display_rolegroups
      end
    end
    
    # Ensures that the common API methods always have a common underlying model to work on
    # @note This Set should be cached and only invalidated when the user has a change of roles    
    # @return Array<Symbol> Set of role names
    def role_list        
      @role_list ||= begin
        (store.display_roles | group_store.display_roles)
      end
    end    
  end
end
