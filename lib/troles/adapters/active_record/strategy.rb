module Troles::ActiveRecord
  module Strategy    
    module BaseMany
      # @param [Class] the role subject class for which to include the Role strategy (fx User Account)
      #
      def self.included(base)
        base.send :include, Troles::Strategy::BaseMany        
      end      
    end
  end
end
