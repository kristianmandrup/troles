module Troles::Common::Macros
  class Configuration  
    class StorageLoader < BaseLoader

      def initialize strategy, orm
        super
      end

      def storage_class
        begin
          "#{orm_namespace}::Storage::#{strategy.to_s.camelize}".constantize
        rescue
          # use generic if no ORM specific strategy found!
          "#{namespace}::Storage::#{strategy.to_s.camelize}".constantize
        end        
      end      
    end
  end
end

