module TroleGroups::ActiveRecord
  module Strategy    
    module BaseMany
      # @param [Class] the role subject class for which to include the Role strategy (fx User Account)
      #
      def self.included(base)
        base.send :include, TroleGroups::Strategy::BaseMany        
      end      
    end
  end
end
