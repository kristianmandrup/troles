require 'trole/storage/generic'

module Troles
  module Storage
    class Generic < Trole::Storage::Generic
      def initialize role_subject
        super
      end      
    end        
  end
end