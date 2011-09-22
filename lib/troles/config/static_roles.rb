module Troles
  class Config
    module StaticRoles
      def static_roles= value
        raise ArgumentError, "Must be a boolean" if !boolean?(value)
        @static_roles = value
      end

      def static_roles?
        @static_roles || false
      end
    end
  end
end
