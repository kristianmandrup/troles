module Troles
  module ValidationApi
    include Trole::ValidationApi

    def check_valid_roles? *roles
      roles = self.class.valid_roles & roles.flatten
      return roles if !roles.empty? 
      false
    end
  end
end