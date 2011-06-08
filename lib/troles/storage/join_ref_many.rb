# @author Kristian Mandrup
# 
# Many role storage for storing multiple Role references on the role subject
#
# @note all methods potentially operate directly on values in the data store
#
module Troles::Storage
  class JoinRefMany < RefMany
    def initialize role_subject
      super
    end
  end
end