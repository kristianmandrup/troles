module Trole::Api
  module Core
    # return the role field used, fx :string_one etc.
    # should NOT be mutable
    def role_field
      :trole
    end  

    # should return a Role::Operations object
    def role
      Trole::Operations.new(self)
    end  
    
    include Trole::Defaults::StaticRole
    extend  Trole::Defaults::StaticRole
  end
end