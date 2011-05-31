module Troles
  module Api
    autoload :CoreApi,        'troles/api/core_api'
    autoload :EventApi,       'troles/api/event_api'
    autoload :ReadApi,        'troles/api/read_api'
    autoload :StoreApi,       'troles/api/store_api'    
    autoload :ValidationApi,  'troles/api/read_api'
    autoload :WriteApi,       'troles/api/write_api'

    include CoreApi
    include EventApi    
    include ReadApi
    include StoreApi
    include WriteApi
  end
end