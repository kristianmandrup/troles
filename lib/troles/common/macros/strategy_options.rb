module Troles:Common
  module Macros
    class StrategyOptions
      attr_reader :subject_class

      def initialize subject_class
        @subject_class = subject_class
      end

      # @param [Symbol] name of the macro to run
      def apply_macro name
        # overrides default method that returns false
        begin
          subject_class.send :include,  "Troles::Macros::#{strategy_name.to_s.camelize}".constantize
        rescue
        end
      end
    end
  end
end
