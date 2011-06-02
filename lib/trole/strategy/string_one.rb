module Trole
  module Strategy
    module StringOne
      include BaseOne

      def strategy
        @strategy ||= Storage.new self
      end
    end
  end
end