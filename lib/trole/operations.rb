module Trole
  class Operations
    autoload :Read,     'trole/operations/read'
    autoload :Write,    'trole/operations/write'  
    
    include Read
    include Write

    def initialize user
      @user = user
    end
  end
end
