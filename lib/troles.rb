require 'trole/shared/main'

module Trole
end

module Troles
  # some default API module methods
  autoload :Defaults,       'troles/defaults'  
  # customized modules for using specific options on role_strategy
  autoload :Customize,      'troles/customize'
  
  autoload :Api,            'troles/api'
  autoload :EventManager,   'troles/event_manager'
  autoload :Operations,     'troles/operations'
  autoload :Strategy,       'troles/strategy'
  autoload :Storage,        'troles/storage'  
  autoload :Marshaller,     'troles/marshaller'  
end