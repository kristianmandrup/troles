# @author Kristian Mandrup
#
# Many role storage for storing a comma ',' seperated String of roles on the role subject
#
# @note all methods potentially operate directly on values in the data store
#
module Troles::Storage
  class StringMany < BaseMany
    def initialize role_subject
      super
    end

    # display the roles as a list of symbols
    # @return [Array<Symbol>] roles list
    def display_roles
      ds_field_value.split(',').map{|r| r.strip }
    end
    
    # saves the role for the user in the data store
    # @param [Array<Symbol>] roles list
    def set_roles *roles
      set_ds_field roles.flatten.map(:to_s).join(',')
    end  

    # clears the role of the user in the data store
    def clear!
      set_ds_field ""
    end
    
    # sets the role to default setting
    def set_default_role!
      clear!
    end        
  end
end