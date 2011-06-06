module Troles  
  module Macros    
    class StrategyOptions
      attr_reader :clazz
  
      def initialize clazz
        @clazz = clazz
      end

      # @param [Symbol] name of the macro to run
      def apply_macro name
        # overrides default method that returns false
        begin 
          clazz.send :include,  "Troles::Macros::#{strategy_name.to_s.camelize}".constantize
        rescue
        end
      end
    end
  end
end
    