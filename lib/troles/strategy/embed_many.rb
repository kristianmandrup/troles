module Troles
  module Strategy
    module EmbedMany
      include BaseMany
            
      def storage 
        Troles::Storage::EmbedMany
      end
    end
  end
end