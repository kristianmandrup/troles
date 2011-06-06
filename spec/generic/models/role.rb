class Role
  attr_accessor :name
  
  def initialize options = {}
    name = options[:name].to_sym
    raise ArgumentError, "Not a valid role label, was: #{name}" if !name.kind_of_label?
    @name = name
    role = self if !Role.exists?(@name)
    Role.roles << role if role
  end
  
  class << self 
    def all
      roles
    end
    
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
      !where(:name => name.to_sym).empty?
    end

    def where options = {}
      Role.roles.select {|r| r.name == options[:name].to_sym }
    end  
  end
end