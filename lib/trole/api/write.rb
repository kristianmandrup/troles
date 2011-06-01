module Trole::Api
  module Write
    def add_role role
      subject << role
    end  

    def remove_role role
      subject - role
    end  

    def subject
      role
    end
    
    module ClassMethods
      def set_valid_role *roles
        roles = roles.select_labels
        raise ArgumentError, "Roles must contain Symbols or Strings" if roles.empty?
        @valid_roles = roles
      end      
    end    
  end
end