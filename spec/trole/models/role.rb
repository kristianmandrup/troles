class Role
  attr_accessor :name
  
  def initialize name
    @name = name
    Role.roles << self
  end
  
  class << self
    def roles= new_roles
      @roles = new_roles
    end

    def roles
      @roles ||= Set.new
    end

    def where options = {}
      Role.roles.select {|r| r.name == options[:name] }
    end  
  end
end