module TroleGroups::Api
  module Read
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
        group_store.display_rolegroups.flatten
      end
    end
  end
end
