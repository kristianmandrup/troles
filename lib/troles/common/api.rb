module Troles::Common
  module Api
    autoload :Core,       'troles/common/api/core'
    autoload :Cache,      'troles/common/api/cache'
    autoload :Event,      'troles/common/api/event'
    autoload :Read,       'troles/common/api/read'
    autoload :Write,      'troles/common/api/write'
    autoload :Validation, 'troles/common/api/validation'


    module ClassMethods
      def apis
        [:core, :cache, :event, :read, :validation, :write]
      end

      def included(base)
        puts "Common API base: #{base}"
        apis.each do |api|
          begin
            puts "include Common API: #{api}"            
            base.include_and_extend :"#{api.to_s.camelize}"
          rescue
          end
        end      
      end
    end
    extend ClassMethods
  end
end