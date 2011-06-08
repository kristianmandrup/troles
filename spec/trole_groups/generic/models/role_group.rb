class RoleGroup
  attr_accessor :name, :roles
  
  def initialize options = {}
    name = options[:name].to_sym
    raise ArgumentError, "Not a valid role label, was: #{name}" if !name.kind_of_label?
    @name = name
    @roles = options[:roles]
    RoleGroup.role_groups << self if !RoleGroup.exists?(name)
  end
  
  class << self 
    def all
      role_groups
    end
    
    def create options = {}
      self.new options 
    end
    
    def role_groups= *names
      @role_groups = names.flatten
    end

    def role_groups
      @role_groups ||= Set.new
    end

    def exists? name
      !where(:name => name.to_sym).empty?
    end

    def where options = {}
      names = [options[:name]].flatten
      RoleGroup.role_groups.select {|r| names.include?(r.name.to_sym) }
    end  
  end
end 

class Array
  def all
    self
  end
end
