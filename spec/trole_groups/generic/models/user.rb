class User
  def rolegroup_list_value
    instance_variable_get "@rolegroup_list"
  end  

  def rolegroup_value
    instance_variable_get "@#{self.class.trolesgroup_config.role_field}"
  end
end