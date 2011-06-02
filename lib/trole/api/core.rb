module Trole::Api
  module Core
    include Trole::Defaults::StaticRole
    
    # should return a Role::Operations object
    def role
      Trole::Operations.new(self)
    end

    def roles
      require 'troles/operations'
      Troles::Operations.new(self)
    end       
        
    module ClassMethods
      include Trole::Defaults::StaticRole      
      
      attr_accessor :valid_roles
                  
      def role_field
        :trole
      end 
    end
  end
end