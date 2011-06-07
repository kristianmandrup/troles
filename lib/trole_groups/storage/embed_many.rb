# @author Kristian Mandrup
#
# Many role storage for storing (embedding) multiple Role instances in a list on the role subject
#
# @note all methods potentially operate directly on values in the data store
#
module TroleGroups::Storage
  class EmbedMany < BaseMany

    # constructor
    # @param [Object] the role subject
    def initialize rolegroupsubject
      super
    end

    def rolegroups_to_embed *rolegroups
      rolegroups.flatten.inject([]) do |res, role| 
        res << create_role(role)
        res
      end
    end           

    # display the rolegroups as a list of symbols
    # @return [Array<Symbol>] rolegroups list
    def display_rolegroups
      return [] if !ds_field_value?
      ds_field_value.map{|rolegroup| rolegroup.name.to_sym }
    end

    # is it set?
    def ds_field_value?
      ds_field_value && !ds_field_value.empty?
    end    
  
    # saves the rolegroups for the role subject in the data store
    # @param [Array<Symbol>] rolegroups list    
    def set_rolegroups *rolegroups
      # creates and embeds new Role instances from symbols
      set_ds_field rolegroups_to_embed(*rolegroups)
    end  

    # clears the role of the user in the data store
    def clear!
      set_ds_field []
    end  
  
    # sets the role to its default state
    def set_default_role!
      clear!
    end
    
    protected
    
    def create_role name
      rolegroup_model.create name
    end
  end
end