module Troles::Common
  class Config
    module Schema
      class Model
        attr_accessor :subject_class, :object_class, :join_class
        
        def initialize subject_class, object_class, join_class
          @subject_class = subject_class
          @object_class = object_class
          @join_class = join_class          
        end
      end
    end
  end
end
