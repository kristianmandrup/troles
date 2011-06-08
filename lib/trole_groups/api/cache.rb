#
# @author Kristian Mandrup
#
# Caching Api to ensure the rolegroup list of a rolegroup subject is cached and invalidated on rolegroup change 
#
module TroleGroups::Api
  module Cache
    def invalidate_rolegroups_cache!
      @rolegroup_list = nil
      invalidate_role_cache!      
    end
  end  
end