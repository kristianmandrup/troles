module Trole
  module CoreApi
    # return the role field used, fx :string_one etc.
    # should NOT be mutable
    def role_field
      :trole
    end  

    # should return a Role::Operations object
    def role
     TRole::Operations.new(self)
    end  

    def StaticRole    
      def static_role?
        false
      end
    end
    
    include StaticRole
    extend  StaticRole
  end
end