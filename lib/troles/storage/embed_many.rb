# @author Kristian Mandrup
#
# @note all methods potentially operate directly on values in the data store
#
module Troles::Storage
  class EmbedMany < Generic
    def initialize role_subject
      super
    end

    def display_roles
      ds_field_value.map{|role| role.name.to_sym }
    end
  
    # saves the role for the user in the data store
    def set_roles *roles
      # creates and embeds new Role instances from symbols
      set_ds_field roles_to_embed(*roles)
    end  

    # clears the role of the user in the data store
    def clear!
      set_ds_field []
    end  
  
    # clears the role of the user in the data store
    def set_default_role!
      clear!
    end
    
    protected
    
    def embedded_roles *roles
      roles.map {|name| Role.create :name => name }
    end    
  end
end