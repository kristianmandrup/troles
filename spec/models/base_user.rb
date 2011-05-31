class BaseUser
  attr_accessor :name
  
  def initialize options = {}
    @name = options[:name] || 'no name'
  end
  
  def save!
    true
  end
end