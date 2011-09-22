# @author Kristian Mandrup
#
# Many role storage for storing roles as an Integer bitmask on the role subject
#
# @note all methods potentially operate directly on values in the data store
#
module Troles::Storage
  class BitMany < BaseMany
    # constructor
    # @param [Object] the role subject
    def initialize role_subject
      super
    end

    # display the roles as a list of symbols
    # see Troles::Marshaller::Bitmask
    # @return [Array<Symbol>] roles list
    def display_roles
      return [] if !ds_field_value?
      bitmask.read
    end

    def ds_field_value?
      ds_field_value == 0
    end

    # saves the roles for the role subject in the data store
    # see Troles::Marshaller::Bitmask
    # @param [Array<Symbol>] roles list
    def set_roles *roles
      roles = roles.to_symbols_uniq
      return clear! if roles.empty?
      set_ds_field bitmask.write(roles.to_symbols)
    end

    # Clears the role state of the role subject 
    def clear!
      set_ds_field 0
    end

    # Sets role to default state
    def set_default_role!
      clear!
    end

    protected

    def bitmask
      @bitmask ||= bitmask_class.new role_subject
    end

    def bitmask_class
      Troles::Common::Marshaller::Bitmask
    end
  end
end
