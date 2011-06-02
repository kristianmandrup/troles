module Troles
  class Operations < Troles::Common::Operations
    autoload :Read,     'troles/operations/read'
    autoload :Write,    'troles/operations/write'
    
    # constructor
    # @param [Object] the role subject, fx a User or UserAccount
    def initialize role_subject
      super
    end    
  end
end