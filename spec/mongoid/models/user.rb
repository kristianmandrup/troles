class User
  include Mongoid::Document
  
  field :name
      
  def role_list_value
    instance_variable_get "@role_list"
  end
end
