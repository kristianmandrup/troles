module Troles
  module Macros
    class Configuration
      autoload :BaseLoader,     'troles/common/macros/configuration/base_loader'
      autoload :StrategyLoader, 'troles/common/macros/configuration/strategy_loader'

      attr_reader :singularity

      def initialize subject_class, strategy, options = {}
        super
      end

      protected

      def namespace
        singularity == :many ? 'troles' : 'trole'
      end

      def singularity
        @singularity ||= (strategy =~ /_many$/) ? :many : :one
      end
    end
  end
end
