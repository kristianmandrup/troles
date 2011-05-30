module Trole
  autoload :CoreApi,            'trole/api/core_api'
  autoload :ReadApi,            'trole/api/core_api'
  autoload :WriteApi,           'trole/api/core_api'
  autoload :StoreApi,           'trole/api/core_api'    

  autoload :Operations,         'trole/operations'
  autoload :ReadOperations,     'trole/operations/read_ops'
  autoload :WriteOperations,    'trole/operations/write_ops'  
end