# @author Kristian Mandrup
# Storage that stores role as a boolean value (false, true)

module Trole::Storage 
  class EmbedOne < Generic

  def initialize api        
    super
  end

  # saves the role for the user in the data store
  def set_role role
    trole = Role.create :name => role
  end  
  
  def set_default_role!
    trole = []
  end          
end      
