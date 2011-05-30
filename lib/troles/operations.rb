module Troles
  class Operations        
    include ReadOperations
    include WriteOperations

    def initialize user
      @user = user
    end
  end
end