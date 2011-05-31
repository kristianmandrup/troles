module Trole
  module Strategy
    module StringOne
      include BaseOne

      def strategy
        @strategy ||= Storage.new self
      end

      class Storage < Trole::Storage::Generic        
        def initialize api        
          super
        end

        # saves the role for the user in the data store
        def set_role role
          trole = role
        end  

        # clears the role of the user in the data store
        def set_default_role!
          trole = ""
        end  
      end
    end
  end
end