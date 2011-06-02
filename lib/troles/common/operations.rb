# @author Kristian Mandrup
# 
# The Operations API object
# 
# Usage example:
#   - user.roles + :admin
#   - user.roles.clear! 
#
module Troles::Common
  class Operations        
    autoload :Read,     'troles/common/operations/read'
    autoload :Write,    'troles/common/operations/write'

    include Read
    include Write

    include Enumerable

    attr_reader :role_subject
    
    # constructor
    # @param [Object] the role subject, fx a User or UserAccount
    def initialize role_subject
      @role_subject = role_subject
    end

    # required method to act as enumerable
    # iterates and yields all roles in the role list (Symbols)
    def each
      list.each { |role| yield role }
    end        
  end
end