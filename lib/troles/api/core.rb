module Troles::Api
  module Core
    # return the role field used, fx :string_one etc.
    # should NOT be mutable
    def role_field
      :troles
    end  

    # should return a Roles::Operations object
    def roles
      Troles::Operations.new(self)
    end
    
    def static_role?
      false
    end      
  end
end