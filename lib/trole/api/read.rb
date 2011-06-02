# 
# @author Kristian Mandrup
#
# Single role Read Api
#
module Trole::Api
  module Read
    # the role name
    # @return [Symbol] the name of the role 
    def role_name
      role_list.first      
    end
  end
end