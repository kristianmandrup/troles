module TroleGroups
  module Api
    autoload :Core,       'trole_groups/api/core'
    autoload :Cache,      'trole_groups/api/cache'
    autoload :Config,     'trole_groups/api/config'
    autoload :Event,      'trole_groups/api/event'
    autoload :Read,       'trole_groups/api/read'
    autoload :Write,      'trole_groups/api/write'
    autoload :Validation, 'trole_groups/api/validation'


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