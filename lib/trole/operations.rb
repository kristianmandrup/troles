class TRole
  module Operations
    include ReadOperations
    include WriteOperations

    def initialize user
      @user = user
    end
  end
end
