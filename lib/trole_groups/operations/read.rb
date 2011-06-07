module TrolesGroups
  class Operations
    module Read      
      # The roles list of the role subject
      # @return [Array<Symbol>] the list of roles
      def list
        role_subject.role_list
      end

      # Test if the role subject has exactly the given roles
      # @param [Array<Symbol>] role list to test
      # @return [true, false] true if role subject has exactly those roles, false otherwise 
      def has? *roles
        list == roles.to_symbols_uniq
      end

      # Which of the given roles are used by the role subject
      # @param [Array<Symbol>] roles to test for inclusion      
      #
      # Usage:
      #  - user.roles.used(:admin, :editor).include? :editor
      #
      def used *roles
        list & roles.to_symbols_uniq
      end
    end
  end
end