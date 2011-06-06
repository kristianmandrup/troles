module Troles::Macros
  class Configuration  
    class BaseLoader
      attr_reader :strategy, :orm
      
      def initialize strategy, orm
        @strategy = strategy
        @orm = orm || Troles::Config.default_orm
      end

      def singularity
        (strategy =~ /_many$/) ? :many : :one
      end
      
      def try_module full_name
        begin
          full_name.constantize
          true
        rescue
          puts "module #{full_name} not found!"
          false
        end
      end

      def base_class
        "Base#{singularity.to_s.camelize}"
      end

      def namespace
        singularity == :many ? 'Troles' : 'Trole'      
      end

      def orm_namespace
        ns = namespace
        ns << "::#{orm.to_s.camelize}" if orm
        ns
      end      
    end
  end
end