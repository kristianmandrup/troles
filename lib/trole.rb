require 'trole/shared/main'

module Trole
  # some default API module methods
  autoload :Defaults,      'trole/defaults'  
  # customized modules for using specific options on role_strategy
  autoload :Customize,     'trole/customize'    

  autoload :Api,            'trole/api'
  autoload :EventManager,   'trole/event_manager'
  autoload :Operations,     'trole/operations'
  autoload :Strategy,       'trole/strategy'    
  
  autoload :Storage,        'trole/storage'      
end