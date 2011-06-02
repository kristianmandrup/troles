module Trole
  module Strategy
    module RefOne
      include BaseOne

      def strategy
        @strategy ||= Storage.new self
      end
    end
  end
end