module Trole::Storage
  class RefOne < Generic        
    def initialize api        
      super
    end

    # saves the role for the user in the data store
    def set_role role
      trole = Role.where(:name => role).first
    end  

    # clears the role of the user in the data store
    def set_default_role!
      trole = nil
    end  
  end
end