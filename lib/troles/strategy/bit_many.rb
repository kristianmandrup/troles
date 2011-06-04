# @author Kristian Mandrup
#
# Many roles strategy to operate on role as an Integer bit mask, where each set bit (1) signals a given role
# from the #valid_roles of the role subject class (fx: UserAccount.valid_roles)
#
module Troles
  module Strategy
    module BitMany     
      #
      # What to add to the role subject class when this role strategy is included
      #
      # @param [Class] the role subject class for which to include the Role strategy (fx User Account)
      def self.included(base)
        base.send :include, BaseMany
        base.send :include, InstanceMethods
        # base.troles_config.generic = false        
        base.troles_config.configure_role_field
      end      

      module InstanceMethods
        # The storage strategy class
        # @return [Class] a storage subclass
        def storage 
          Troles::Storage::BitMany
        end
      end
    end
  end
end