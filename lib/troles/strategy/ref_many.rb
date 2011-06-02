module Troles
  module Strategy
    module RefMany
      include BaseMany
      
      def storage 
        Troles::Storage::RefMany
      end
    end
  end
end