module Troles::Mongoid
  module Strategy    
    module BaseMany
      # @param [Class] the role subject class for which to include the Role strategy (fx User Account)
      #
      def self.included(base)
        base.send :include, Troles::Strategy::BaseMany        
        base.extend Config         
      end
      
      module Config
        def troles_config
          @troles_config ||= Trole::Mongoid::Config.new self
        end
      end
    end
  end
end
