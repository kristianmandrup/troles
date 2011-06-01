module Troles
  class Operations
    module WriteOps
      # assignment
      def = *roles
        role_subject.set_roles roles        
      end
      alias_method :set, :"="

      # add role
      def + *roles
        role_subject.add_roles roles
      end
      alias_method :<<, :+
      alias_method :add, :+

      # remove roles
      def - *roles
        role_subject.remove_roles roles
      end

      def clear!
        role_subject.clear_roles!
      end    
    end
  end
end