module Trole
  module Strategy
    module EmbedOne
      include BaseOne

      def strategy
        @strategy ||= Storage.new self
      end
    end
  end
end