require 'troles/common/dependencies'

# @author Kristian Mandrup
# The Common (Generic) Roles API, functionality to be reused by both Trole and Troles
module Troles
  module Common
    autoload :Api,          'troles/common/api'
    autoload :Operations,   'troles/common/operations'
    autoload :Marshaller,   'troles/common/marshaller'    
end