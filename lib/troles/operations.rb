module Troles
  class Operations        
    autoload :ReadOps,     'troles/operations/read_ops'
    autoload :WriteOps,    'troles/operations/write_ops'
    
    include ReadOps
    include WriteOps

    def initialize user
      @user = user
    end
  end
end