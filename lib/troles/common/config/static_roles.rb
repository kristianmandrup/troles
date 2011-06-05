module Troles::Common
  class Config
    module StaticRoles    
      def static_roles_for_class= value
        raise ArgumentError, "Must be a boolean" if !boolean?(value)
        @static_roles_for_class = value      
      end

      def static_roles_for_class?
        @static_roles_for_class || false
      end
    end
  end
end