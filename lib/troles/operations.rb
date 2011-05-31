module Troles
  class Operations        
    autoload :ReadOperations,     'troles/operations/read_ops'
    autoload :WriteOperations,    'troles/operations/write_ops'
    
    include ReadOperations
    include WriteOperations

    def initialize user
      @user = user
    end
  end
end