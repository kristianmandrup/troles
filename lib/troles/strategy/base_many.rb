# @author Kristian Mandrup
# Base module for Many strategy
module Troles
  module Strategy    
    module BaseMany
      def store
        @store ||= storage.new self
      end

      def storage 
        Troles::Storage::Generic
      end
      
      def self.included(base)
        base.send :include, Troles::Api

        # base.send :attr_accessor, base.role_field
      end      
    end
  end
end