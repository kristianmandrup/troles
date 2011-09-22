# @author Kristian Mandrup
#
# Many role storage for storing a comma ',' seperated String of roles on the role subject
#
# @note all methods potentially operate directly on values in the data store
#
module Troles::Storage
  class StringMany < BaseMany
    def initialize role_subject
      super
    end

    # display the roles as a list of symbols
    # @return [Array<Symbol>] roles list
    def display_roles
      return [] if !ds_field_value?
      ds_field_value.split(',').map{|r| r.strip }.map(&:to_sym)
    end

    def ds_field_value?
      ds_field_value && !ds_field_value.empty?
    end

    # saves the role for the user in the data store
    # @param [Array<Symbol>] roles list
    def set_roles *roles
      value = roles.flatten.map(&:to_s).join(',')
      set_ds_field value
    end

    # clears the role of the user in the data store
    def clear!
      set_ds_field ""
    end

    # sets the role to default setting
    def set_default_role!
      clear!
    end
  end
end
