require 'trole/api'

module Troles
  module Api
    autoload :Core,       'troles/api/core'
    autoload :Cache,      'troles/api/cache'    
    autoload :Event,      'troles/api/event'
    autoload :Read,       'troles/api/read'
    autoload :Store,      'troles/api/store'    
    autoload :Validation, 'troles/api/validation'
    autoload :Write,      'troles/api/write'

    extend Trole::Api::ClassMethods
  end
end