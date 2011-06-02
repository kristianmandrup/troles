module Troles
  module Strategy
    module StringMany
      include BaseMany
            
      def storage 
        Troles::Storage::StringMany
      end      
    end
  end
end