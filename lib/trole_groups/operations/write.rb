# @author Kristian Mandrup
module Trole_groupsGroups
  class Operations
    module Write
      
      # Test role_groups equality
      # @param [Array<Symbol>] role_groups list to test
      def == *role_groups
        rolegroup_subject.rolegroup_list == role_groups.flatten
      end
      alias_method :equal, :"=="
      alias_method :same_as, :"=="

      # Add a set of role_groups to the role subject
      # @param  [Array<Symbol>] role_groups list to add
      # @return [true, false, Error] true if added, false if static or invalid, Error on some error
      def + *role_groups
        rolegroup_subject.add_role_groups role_groups
      end
      alias_method :<<, :+
      alias_method :add, :+
      alias_method :add!, :+                           

      # Remove a set of role_groups from the role subject
      # @param  [Array<Symbol>] role_groups list to add
      # @return [true, false, Error] true if removed, false if static or invalid, Error on some error
      def - *role_groups
        rolegroup_subject.remove_role_groups role_groups
      end
      alias_method :remove, :-
      alias_method :remove!, :-

      # Clear all the role_groups from the role subject
      # @param  [Array<Symbol>] role_groups list to add
      # @return [true, false, Error] true if removed, false if static or invalid, Error on some error
      def clear
        rolegroup_subject.clear_role_groups!
      end    
      alias_method :clear!, :clear
    end
  end
end