module Troles
  module Strategy
    module EmbedOne
      include BaseOne

      # saves the role for the user in the data store
      def set_roles roles
        # creates and embeds new Role instances from symbols
        troles = valid_roles(roles).map {|name| Role.new :name => name }
      end  

      # clears the role of the user in the data store
      def clear!
        troles = []
      end  
    end
  end
end