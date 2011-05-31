module Trole
  module Api
    autoload :CoreApi,        'trole/api/core_api'
    autoload :EventApi,       'trole/api/event_api'
    autoload :ReadApi,        'trole/api/read_api'
    autoload :StoreApi,       'trole/api/store_api'    
    autoload :ValidationApi,  'trole/api/read_api'
    autoload :WriteApi,       'trole/api/write_api'    
        
    include CoreApi
    include EventApi    
    include ReadApi
    include StoreApi
    include WriteApi
  end
end