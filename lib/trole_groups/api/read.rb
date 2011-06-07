module TroleGroups::Api
  module Read
    # any? on rolegroups_list
    def in_rolegroup? rolegroup
    end

    # rolegroup_list has one element which is rolegroup
    def is_rolegroup? rolegroup
    end

    # subtraction of role_groups from rolegroups_list is empty
    def has_all_rolegroups? rolegroups
    end

    # union of rolegroups and rolegroups_list is not empty
    def in_any_rolegroup? rolegroups
    end

    # return roles of that rolegroup
    def roles_of rolegroup
    end

    # return Set of symbols,where each symbol is a rolegroup name
    # This set should be cached and only invalidated when the user has a change of roles
    def rolegroup_list  
    end
  end
end