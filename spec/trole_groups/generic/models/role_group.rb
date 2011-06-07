class RoleGroup
  attr_accessor :name
  
  def initialize *roles
    @troles = roles
  end

  class << self
    def valid_roles      
    end
  end    

  def roles
    @troles
  end

  def roles= *roles
    @troles = roles.flatten.compact.uniq
  end

  def add_roles *role_names
    roles = (roles & role_names)
  end

  def remove_roles *role_names
    roles = (roles - role_names)    
  end
end