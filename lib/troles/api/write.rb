require 'trole/api/write'

module Troles::Api
  module Write
    include Trole::Api::Write
    
    def add_roles *roles      
      set_roles role_list + roles.to_symbols
    end  

    def remove_roles *roles
      set_roles role_list - roles.to_symbols
    end  
    
    module ClassMethods
      def set_valid_roles *roles
        roles = roles.flat_uniq.select_labels
        raise ArgumentError, "Roles must contain Symbols or Strings" if roles.empty?
        @valid_roles = roles
      end      
    end          
  end
end