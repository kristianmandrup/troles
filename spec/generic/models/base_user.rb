class BaseUser
  attr_accessor :name
  
  def initialize options = {}
    @name = options[:name] || 'no name'
  end

  def role_list_value
    instance_variable_get "@role_list"
  end  

  def role_value
    instance_variable_get "@#{self.class.troles_config.role_field}"
  end

  def troles_changed?
    false
  end

  def trole_changed?    
    false
  end
  
  def save!
    true
  end
end