module Trole
  module ValidationApi
    def check_valid_role? role
      return role if self.class.valid_roles.include? role
      false
    end
  end
end