# @author Kristian Mandrup
#
# Many roles strategy to operate on role as a list of Role instance references
#
module Troles
  module Strategy
    module RefMany
      #
      # What to add to the role subject class when this role strategy is included
      #
      def self.included(base)
        base.send :include, BaseMany
      end

      # The storage strategy class
      # @return [Class] a storage subclass
      def storage 
        Troles::Storage::RefMany
      end
    end
  end
end