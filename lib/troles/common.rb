#
# @author Kristian Mandrup
#
# The Common (Generic) Roles API, functionality to be reused by both Trole and Troles
#
require 'troles/common/dependencies'

module Troles
  module Common
    autoload :Api,          'troles/common/api'
    autoload :Config,       'troles/common/config'
    autoload :Operations,   'troles/common/operations'
    autoload :Marshaller,   'troles/common/marshaller'
    autoload :Storage,      'troles/common/storage'
    autoload :EventManager, 'troles/common/event_manager'
  end
end
