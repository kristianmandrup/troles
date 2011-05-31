require 'trole/api/write'

module Troles::Api
  module Write
    include Trole::Api::Write
    
    def add_roles *roles_to_add
      subject << roles_to_add 
    end  

    def remove_roles *roles_to_remove
      subject << roles_to_remove
    end  

    def subject
      roles
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