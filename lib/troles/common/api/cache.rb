#
# @author Kristian Mandrup
#
# Caching Api to ensure the role list of a role subject is cached and invalidated on role change 
#
module Troles::Common::Api
  module Cache
    def invalidate_role_cache!
      @role_list = nil
    end
  end
end
