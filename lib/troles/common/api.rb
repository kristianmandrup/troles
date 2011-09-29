module Troles::Common
  module Api
    autoload :Core,       'troles/common/api/core'
    autoload :Cache,      'troles/common/api/cache'
    autoload :Config,     'troles/common/api/config'
    autoload :Event,      'troles/common/api/event'
    autoload :Read,       'troles/common/api/read'
    autoload :Write,      'troles/common/api/write'
    autoload :Validation, 'troles/common/api/validation'


    module ClassMethods
      def apis
        [:core, :cache, :config, :event, :read, :validation, :write]
      end

      def included(base)
        puts "Included #{base}"
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
