module TroleGroups
  module Api
    autoload :Core,       'trole_groups/common/api/core'
    autoload :Cache,      'trole_groups/common/api/cache'
    autoload :Config,     'trole_groups/common/api/config'
    autoload :Event,      'trole_groups/common/api/event'
    autoload :Read,       'trole_groups/common/api/read'
    autoload :Write,      'trole_groups/common/api/write'
    autoload :Validation, 'trole_groups/common/api/validation'


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