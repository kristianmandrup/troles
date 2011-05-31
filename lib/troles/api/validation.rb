require 'trole/api/validation'

module Troles::Api
  module Validation
    include Trole::Api::Validation

    def check_valid_roles? *roles
      roles = self.class.valid_roles.to_symbols & roles.to_symbols
      return roles if !roles.empty? 
      false
    end
  end
end