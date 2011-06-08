module TroleGroups::Macros
  class Configuration  
    class BaseLoader
      attr_reader :strategy, :orm
      
      def initialize strategy, orm
        @strategy = strategy
        @orm = orm || Troles::Config.default_orm
      end
      
      def try_module full_name
        begin
          full_name.constantize
          true
        rescue
          false
        end
      end

      def base_class
        "BaseMany"
      end

      def namespace
        'TroleGroups'
      end

      def orm_namespace
        ns = namespace
        ns << "::#{orm.to_s.camelize}" if orm
        ns
      end      
    end
  end
end