module Trole
  module WriteApi
    def add_role role_to_add
      roles << role
    end  

    def remove_role role_to_remove
      roles - role_to_remove
    end  
  end
end