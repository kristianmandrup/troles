module Trole
  module Storage
    class Generic < Troles::Storage::Generic
      def initialize role_subject
        super
      end      
    end        
  end
end