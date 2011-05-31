class Trole
  module Operations
    autoload :ReadOperations,     'trole/operations/read_ops'
    autoload :WriteOperations,    'trole/operations/write_ops'  
    
    include ReadOperations
    include WriteOperations

    def initialize user
      @user = user
    end
  end
end
