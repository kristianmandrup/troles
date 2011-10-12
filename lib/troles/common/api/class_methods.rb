module Troles::Common::Api
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
end
