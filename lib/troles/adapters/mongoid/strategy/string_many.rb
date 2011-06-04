# @author Kristian Mandrup
#
# Many roles strategy to operate on role as a comma seperated String
#
module Troles::Mongoid::Strategy
  module StringMany

    # What to add to the role subject class when this role strategy is included
    # @param [Class] the role subject class to  
    def self.included(base)
      base.send :include, BaseMany
      base.send :include, InstanceMethods      
    end

    module InstanceMethods
      # The storage strategy class
      # @return [Class] a storage subclass
      def storage 
        Troles::Mongoid::Storage::StringMany
      end      
    end
  end
end
