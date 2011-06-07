module TroleGroups::Api
  module Write
    def add_rolegroup
      role_groups << role
    end

    def remove_rolegroup
      role_groups << role
    end
  end
end