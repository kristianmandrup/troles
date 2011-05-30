module Troles
  autoload :CoreApi,            'troles/api/core_api'
  autoload :ReadApi,            'troles/api/core_api'
  autoload :WriteApi,           'troles/api/core_api'
  autoload :StoreApi,           'troles/api/core_api'    

  autoload :Operations,         'troles/operations'
  autoload :ReadOperations,     'troles/operations/read_ops'
  autoload :WriteOperations,    'troles/operations/write_ops'
end