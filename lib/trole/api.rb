# @author Kristian Mandrup
#
#
module Trole
  module Api
    autoload :Core,        'trole/api/core'
    autoload :Cache,       'trole/api/cache'
    autoload :Event,       'trole/api/event'
    autoload :Read,        'trole/api/read'
    autoload :Validation,  'trole/api/validation'
    autoload :Write,       'trole/api/write'    

    # Needs refactor - move into Common!
    module ClassMethods
      def included(base)
        # first include all from common Api
        apis.each do |api|
          begin
            base.include  "Troles::Common::Api::#{api.to_s.camelize}".constantize
            base.extend   "Troles::Common::Api::#{api.to_s.camelize}::ClassMethods".constantize
          rescue
          end
        end        

        # then override any methods with local api
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