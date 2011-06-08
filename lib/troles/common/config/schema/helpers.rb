module Troles::Common
  class Config
    module Schema
      module Helpers
        def valid_field_name? name
          return false if !name || name.empty?
          raise ArgumentException, "Role field must not be named role or roles as these names are reserved by troles!" if [:role, :roles].include? name.to_sym
          true
        end

        def boolean? value
          [true, false].include? value
        end

        # TODO: Needs extraction into helper module!

        def belongs_to_for from, to, options = {}
          make_relationship :belongs_to, from, to, options
        end

        def has_many_for from, to, options = {}
          make_relationship :has_many, from, to, options
        end

        def has_one_for from, to, options = {}
          make_relationship :has_one, from, to, options
        end

        # To setup sth like this:
        #
        # class UserAccount < ActiveRecord::Base    
        #   has_and_belongs_to_many :troles, :class_name => 'Role'
        # end
        # 
        # class Role < ActiveRecord::Base    
        #   has_and_belongs_to_many :user_accounts, :class_name => 'User'
        # end
        def has_and_belongs_many from, to, options = {}
          make_relationship :has_and_belongs_to_many, from, to, :key => role_field
          make_relationship :has_and_belongs_to_many, to, from, options
        end

        def get_model_type class_name
          return :user if class_name == subject_class
          return :role if class_name == object_model
          raise "Not a known model: #{class_name}"
        end

        # options: 
        # - :opts, extras options, fx to set the :through relationship
        # - :key (usually to enforce use of role_field as key name)      
        def make_relationship type, from, to, options = {}
          # puts "type: #{type}, #{from}, #{to}"
          from_type = get_model_type from
          to_type = get_model_type to

          model_key = options[:key] ? options[:key] : send("#{from_type}_key")

          class_name = send "#{to_type}_class_name"

          options = {:class_name => class_name}
          options.merge!(options[:opts]) if options[:opts]
          puts "#{from}.#{type} :#{model_key}, #{options.inspect}" if log_on?
          from.send(type, model_key, options)
        end
            
        def object_key
          make_key object_class_name
        end

        def make_key name
          name.to_s.gsub(/::/, '__').underscore.pluralize      
        end
      end
    end
  end
end