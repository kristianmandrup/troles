module Trole
  class Operations
    module WriteOps

      # assignment
      def == role
        role_subject.role_list == role
      end
      alias_method :equal, :"=="

      # add role
      def + role
        role_subject.add_role(role)
      end
      alias_method :<<, :+
      alias_method :add, :+

      # remove role
      def - role         
        role_subject.remove_role(role)
      end
    
      protected
    
      def clear!
        role_subject.clear_role!
      end    
    end
  end
end