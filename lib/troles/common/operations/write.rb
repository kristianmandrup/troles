# @author Kristian Mandrup
module Troles::Common
  class Operations
    module Write

      # Test roles equality
      # @param [Array<Symbol>] roles list to test
      def == *roles
        role_subject.role_list == roles.flatten
      end
      alias_method :equal, :"=="
      alias_method :same_as, :"=="

      # Add a set of roles to the role subject
      # @param  [Array<Symbol>] roles list to add
      # @return [true, false, Error] true if added, false if static or invalid, Error on some error
      def + *roles
        role_subject.add_roles roles
      end
      alias_method :<<, :+
      alias_method :add, :+
      alias_method :add!, :+

      # Remove a set of roles from the role subject
      # @param  [Array<Symbol>] roles list to add
      # @return [true, false, Error] true if removed, false if static or invalid, Error on some error
      def - *roles
        role_subject.remove_roles roles
      end
      alias_method :remove, :-
      alias_method :remove!, :-

      # Clear all the roles from the role subject
      # @param  [Array<Symbol>] roles list to add
      # @return [true, false, Error] true if removed, false if static or invalid, Error on some error
      def clear
        role_subject.clear_roles!
      end
      alias_method :clear!, :clear
    end
  end
end
