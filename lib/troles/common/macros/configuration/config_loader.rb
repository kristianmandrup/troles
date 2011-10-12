module Troles::Common::Macros
  class Configuration  
    class ConfigLoader < BaseLoader
            
      def initialize strategy, orm
        super
      end

      def config_class
        begin       
          "#{orm_namespace}::Config".constantize
        rescue
          # use generic if no ORM specific strategy found!
          "#{namespace}::Config".constantize
        end        
      end
    end
  end
end
