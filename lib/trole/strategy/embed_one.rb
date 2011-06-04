#
# @author Kristian Mandrup
#
# Single role strategy to save role as an embedded Role instance
# 
module Trole::Strategy
  module EmbedOne
    #
    # What to add to the role subject class when this role strategy is included
    #
    # @param [Class] the role subject class for which to include the Role strategy (fx User Account)
    #
    def self.included(base)
      base.send :include, BaseOne
    end
  end
end