module Trole::Api
  module Cache
    module Shared  
      def invalidate_role_cache!
        @role_list = nil      
      end
    end
    include Shared
  end  
end