module Troles
  module Strategy
    module BitMany     
      def self.included(base)
        base.send :include, BaseMany
      end      
      
      def storage 
        Troles::Storage::BitMany
      end
    end
  end
end