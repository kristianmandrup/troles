module TroleGroups
  class Operations < Troles::Common::Operations
    autoload :Read,     'trole_groups/operations/read'
    autoload :Write,    'trole_groups/operations/write'
    
    include Read
    include Write

    include Enumerable

    attr_reader :rolegroup_subject
    
    # constructor
    # @param [Object] the role subject, fx a User or UserAccount
    def initialize rolegroup_subject
      @rolegroup_subject = rolegroup_subject
    end

    # required method to act as enumerable
    # iterates and yields all roles in the role list (Symbols)
    def each
      list.each { |rolegroup| yield rolegroup }
    end        
  end
end