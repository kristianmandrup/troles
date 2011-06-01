module Troles
  class Operations
    module ReadOps
      # check if the roles list has the given role
      def contains? *role
       role_subject.has_all_roles? *roles
      end
      alias_method :includes?, :contains?

      # symbol list
      def list
        role_subject.role_list
      end

      # filter list of symbols 
      # on whether they are currently present/used as roles
      def used *roles
        role_subject.role_list & roles
      end
    end
  end
end