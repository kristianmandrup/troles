# @author Kristian Mandrup
#
# Base module for Many roles strategies
#
module Troles
  module Strategy    
    module BaseMany
      #
      # a Many role strategy is included by a role subject (fx a UserAccount class) 
      # a Many role strategy should always include BaseMany
      # when BaseMany is included, it ensures that the complete 
      # Troles API is also included into the role subject
      #
      # @note the Trole::Api also includes the Troles::Common::Api
      #
      # @param [Class] the role subject class for which to include the Role strategy (fx User Account)
      #
      def self.included(base)
        base.send :include, Troles::Api
        puts "generic? #{base.troles_config.generic?}"
        base.send(:attr_accessor, base.role_field) if base.troles_config.generic? # create troles accessor      
      end      

      # The storage to use
      # @return [Troles::Storage] a storage subclass instance matching the needs of the strategy
      def store
        @store ||= storage.new self
      end

      # @return [Class] the storage strategy class
      def storage 
        raise "Must be implemented by subclass" # Troles::Storage::BaseMany
      end      
    end
  end
end