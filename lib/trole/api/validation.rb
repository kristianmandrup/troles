module Trole::Api
  module Validation
    def check_valid_role? role
      return role if self.class.valid_roles.include? role.to_sym
      false
    end
  end
end