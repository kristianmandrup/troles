#
# @author Kristian Mandrup
#
# Single role strategy to operate on role as a Role instance reference 
# 
module Trole::Strategy
  module RefOne
    #
    # What to add to the role subject class when this role strategy is included
    #
    # @param [Class] the role subject class for which to include the Role strategy (fx User Account)
    #
    def self.included(base)
      base.send :include, BaseOne
    end

    # The storage strategy class
    # @return [Class] a storage subclass
    def storage 
      Troles::Storage::RefOne
    end      
  end
end
