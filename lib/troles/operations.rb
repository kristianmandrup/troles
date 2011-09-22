module Troles
  class Operations < Troles::Common::Operations
    autoload_modules :Read, :Write

    # constructor
    # @param [Object] the role subject, fx a User or UserAccount
    def initialize role_subject
      super
    end
  end
end
