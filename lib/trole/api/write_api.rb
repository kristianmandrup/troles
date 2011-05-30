module Trole
  module WriteApi
    def add_role role_to_add
      subject << role_to_add
    end  

    def remove_role role_to_remove
      subject - role_to_remove
    end  

    def subject
      role
    end
    
    module ClassMethods
      def set_valid_roles roles
        roles = roles.select_labels
        raise ArgumentError, "Roles must contain Symbols or Strings" if roles.empty?
        @valid_roles = roles
      end      
    end    
  end
end