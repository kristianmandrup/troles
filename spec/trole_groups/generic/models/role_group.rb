class RoleGroup
  attr_accessor :name
  
  def initialize options = {}
    @name = name
    roles = options[:roles]
  end

  class << self
    def create options = {}
      self.new options
    end
  end
end