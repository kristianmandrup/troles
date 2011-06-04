module Troles::Api
  module Core    
    module ClassMethods      
      def role_field
        troles_config.role_field
      end      
    end
  end
end