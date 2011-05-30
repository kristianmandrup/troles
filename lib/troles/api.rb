module Troles
  module Api
    include CoreApi
    include EventApi    
    include ReadApi
    include StoreApi
    include WriteApi
  end
end