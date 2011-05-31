module Trole::Api
  module Core
    # should return a Role::Operations object
    def role
      Trole::Operations.new(self)
    end    
  end
end