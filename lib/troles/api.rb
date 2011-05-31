module Troles
  module Api
    autoload :Core,       'troles/api/core'
    autoload :Event,      'troles/api/event'
    autoload :Read,       'troles/api/read'
    autoload :Store,      'troles/api/store'    
    autoload :Validation, 'troles/api/read'
    autoload :Write,      'troles/api/write'

    include Core
    include Event    
    include Read
    include Store
    include Write
  end
end