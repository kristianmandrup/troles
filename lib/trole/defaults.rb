module Trole
  module Defaults
    module StaticRole
      def static_role?
        self.class.role_field
      end

      module ClassMethods
        def static_role?
          true
        end  
      end
    end
  end
end