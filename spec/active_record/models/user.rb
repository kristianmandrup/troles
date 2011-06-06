class User < ActiveRecord::Base  
  def role_list_value
    instance_variable_get "@role_list"
  end
end
