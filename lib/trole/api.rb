# 
# @author Kristian Mandrup
#
# Single role Api to be included directly on the role subject class (fx User or User Account)
#
module Trole
  module Api
    autoload :Core,        'trole/api/core'
    autoload :Cache,       'trole/api/cache'
    autoload :Event,       'trole/api/event'
    autoload :Read,        'trole/api/read'
    autoload :Validation,  'trole/api/validation'
    autoload :Write,       'trole/api/write'    

    #
    # When the Trole::Api is included by the Role Subject class (fx a User Account)
    # first include methods from Troles Common API      
    # then include Trole API on top
    #
    # @param [Class] the role subject class (fx User or UserAccount)
    #
    module ClassMethods
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