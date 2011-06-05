module Troles::Common
  class Config
    module SchemaHelpers
      def valid_field_name? name
        return false if !name || name.empty?
        raise ArgumentException, "Role field must not be named role or roles as these names are reserved by troles!" if [:role, :roles].include? name.to_sym
        true
      end

      def boolean? value
        [true, false].include? value
      end

      # TODO: Needs extraction into helper module!

      def belong_to from, to
        make_relationship :belongs_to, from, to
      end

      def has_many_for from, to, through = nil
        make_relationship :has_many, from, to, through
      end

      def make_relationship type, from, to, through
        model_key = send "#{from}_key"
        class_name = send "#{to}_class_name"
        options = {:class_name => class_name}
        options.merge!(through) if through
        from.send(type, model_key, options)
      end

      def user_class_name
        clazz.to_s
      end

      def user_key
        make_key user_class_name
      end

      def join_class_name
        join_model.to_s
      end

      def join_key
        make_key join_class_name
      end

      def role_class_name
        role_model.to_s
      end

      def role_key
        make_key role_class_name
      end

      def make_key name
        name.gsub(/::/, '__').underscore      
      end
    end
  end
end