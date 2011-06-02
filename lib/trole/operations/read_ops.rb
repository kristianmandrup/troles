module Trole
  class Operations      
    module ReadOps
      # check if the roles list has the given role
      def contains? role
        role_subject.role_name == role
      end
      alias_method :includes?, :contains?

      # symbol list
      def list
        role_subject.role_list
      end

      # filter list of symbols 
      # on whether they are present as roles
      def used *roles
        role_subject.role_list & roles.to_symbols_uniq
      end   
    end
  end
end


