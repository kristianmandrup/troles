module Trole::Api
  module Read
    # @return [Symbol] the name of the role 
    def role_name
      role_list.first      
    end
  end
end