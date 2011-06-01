module Troles::Api
  module Core
    include Troles::Defaults::StaticRole
    
    # should return a Roles::Operations object
    def roles
      Troles::Operations.new self
    end    

    module ClassMethods
      include Troles::Defaults::StaticRole
      
      attr_accessor :valid_roles
            
      def role_field
        :troles
      end      
    end
  end
end