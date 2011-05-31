module Trole
  class Operations
    autoload :ReadOps,     'trole/operations/read_ops'
    autoload :WriteOps,    'trole/operations/write_ops'  
    
    include ReadOps
    include WriteOps

    def initialize user
      @user = user
    end
  end
end
