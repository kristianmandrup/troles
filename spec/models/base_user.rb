class BaseUser
  attr_accessor :name
  
  def initialize options = {}
    @name = options[:name] || 'no name'
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