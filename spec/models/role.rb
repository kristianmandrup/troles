class Role
  attr_accessor :name
  
  def initialize name
    raise ArgumentError, "Not a valid role label" if !name.kind_of_label?
    @name = name.to_sym
    Role.roles << self if !Role.exists?(name)
  end
  
  class << self 
    def create options = {}
      self.new options 
    end
    
    def roles= new_roles
      @roles = new_roles
    end

    def roles
      @roles ||= Set.new
    end

    def exists? name
      where :name => name.to_sym
    end

    def where options = {}
      Role.roles.select {|r| r.name == options[:name].to_sym }
    end  
  end
end