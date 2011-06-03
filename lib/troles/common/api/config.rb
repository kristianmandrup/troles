module Troles::Common::Api
  module Config
    module ClassMethods
      def troles_config
        @troles_config ||= Troles::Common::Config.new 
      end 
    end
  end
end
