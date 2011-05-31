class Class
  def include_and_extend(the_module, options={})
    options[:instance_methods] ||= :InstanceMethods
    options[:class_methods] ||= :ClassMethods
    # Mainly include but be flexible
    main_module = const_get(the_module)
    include main_module # for an extend_and_include method, change this to extend main_module
    include main_module.const_get(options[:instance_methods]) if main_module.const_defined?(options[:instance_methods])
    extend main_module.const_get(options[:class_methods]) if main_module.const_defined?(options[:class_methods])
  end
end