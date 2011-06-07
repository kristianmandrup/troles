module TroleGroups
  class Config    
    # return the role field used, fx :rolegroup_value etc.
    # should NOT be mutable
    def rolegroups_field
      :trolegroups
    end    
  end
end
