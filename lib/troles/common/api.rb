module Troles::Common
  module Api
    autoload_modules :Core, :Cache, :Config, :Event, :Read, :Write, :Validation

    module ClassMethods
      def apis
        [:core, :cache, :config, :event, :read, :validation, :write]
      end

      def included(base)
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
