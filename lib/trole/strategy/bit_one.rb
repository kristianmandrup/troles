module Trole
  module Strategy
    module BitOne # boolean flag
      autoload :Storage, 'trole/strategy/bit_one/storage'
      
      def self.included(base)
        base.send :include, BaseOne
        base.valid_roles = [:user, :admin] # default binary roles 
      end

      def strategy
        @strategy ||= Storage.new self
      end
    end
  end
end