module Trole
  module Api
    autoload :Core,        'trole/api/core'
    autoload :Cache,       'trole/api/cache'
    autoload :Event,       'trole/api/event'
    autoload :Read,        'trole/api/read'
    autoload :Store,       'trole/api/store'    
    autoload :Validation,  'trole/api/validation'
    autoload :Write,       'trole/api/write'    

    module ClassMethods
      def included(base)
        apis.each do |api|
          begin
            base.include_and_extend :"#{api.to_s.camelize}"
          rescue
          end
        end  
      end

      def apis
        [:core, :cache, :event, :read, :store, :validation, :write]
      end
    end
    extend ClassMethods    
  end
end