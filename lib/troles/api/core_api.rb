module Troles
  module CoreApi
    # return the role field used, fx :string_one etc.
    # should NOT be mutable
    def role_field
      :troles
    end  

    # should return a Roles::Operations object
    def roles
     TRoles::Operations.new(self)
    end  
  end
end