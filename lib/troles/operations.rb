module Troles
  class Operations        
    autoload :ReadOps,     'troles/operations/read_ops'
    autoload :WriteOps,    'troles/operations/write_ops'
    
    include ReadOps
    include WriteOps

    attr_reader :role_subject

    def initialize role_subject
      @role_subject = role_subject
    end
  end
end