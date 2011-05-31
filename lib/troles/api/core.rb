module Troles::Api
  module Core
    def static_roles?
      false
    end    
    
    # should return a Roles::Operations object
    def roles
      Troles::Operations.new(self)
    end    
  end
end