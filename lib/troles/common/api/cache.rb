module Troles::Common::Api
  module Cache
    def invalidate_role_cache!
      @role_list = nil      
    end
  end  
end