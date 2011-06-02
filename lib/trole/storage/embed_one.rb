#
# @author Kristian Mandrup
#
# Storage that stores role as an embedded Role instance
#
module Trole::Storage 
  class EmbedOne < BaseOne

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
