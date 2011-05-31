module Trole
  module Api
    autoload :Core,        'trole/api/core'
    autoload :Event,       'trole/api/event'
    autoload :Read,        'trole/api/read'
    autoload :Store,       'trole/api/store'    
    autoload :Validation,  'trole/api/read'
    autoload :Write,       'trole/api/write'    
        
    include Core
    include Event    
    include Read
    include Store
    include Write
  end
end