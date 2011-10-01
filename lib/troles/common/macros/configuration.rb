module Troles::Common
  module Macros
    class Configuration
      autoload_modules :BaseLoader, :StrategyLoader

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
