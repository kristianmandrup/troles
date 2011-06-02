# 
# @author Kristian Mandrup
#
# Many roles Api to be included directly on the role subject class (fx User or User Account)
#
module Troles
  module Api
    autoload :Core,       'troles/api/core'
    autoload :Cache,      'troles/api/cache'    
    autoload :Event,      'troles/api/event'
    autoload :Read,       'troles/api/read'
    autoload :Store,      'troles/api/store'    
    autoload :Validation, 'troles/api/validation'
    autoload :Write,      'troles/api/write'

    module ClassMethods      
      #
      # When the Troles::Api is included by the Role Subject class (fx a User Account)
      # first include methods from Troles Common API      
      # then include Troles API on top
      #
      # @param [Class] the role subject class (fx User or UserAccount)
      #
      def included(base)
        base.send :include, Troles::Common::Api
        apis.each do |api|
          begin
            base.include_and_extend :"#{api.to_s.camelize}"
          rescue
          end
        end  
      end
    end
    extend ClassMethods
  end
end