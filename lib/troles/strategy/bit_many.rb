module Troles
  module Strategy
    module BitMany
      autoload :Storage, 'troles/strategy/bit_many/storage'
     
      def self.included(base)
        base.send :include, BaseMany
      end      

      def strategy
        @strategy ||= Storage.new self
      end
    end
  end
end