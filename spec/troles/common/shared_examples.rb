# See http://blog.davidchelimsky.net/2010/11/07/specifying-mixins-with-shared-example-groups-in-rspec-2/
# And: http://relishapp.com/rspec/rspec-core/v/2-6/dir/example-groups/shared-examples
# Also: http://stackoverflow.com/questions/6152359/dynamically-generating-shared-examples-in-rspec-2

require_all File.dirname(__FILE__) + '/apis'

shared_examples_for "Common API" do
  include UserSetup 
     
  it_behaves_like "Common Core API" do
    let(:no_roles_user) { create_no_roles_user  }
    let(:user)          { create_user  }
    let(:admin_user)    { create_admin_user  }
  end  

  it_behaves_like "Common Event API" do
    let(:no_roles_user) { create_no_roles_user  }
    let(:user)          { create_user  }
    let(:admin_user)    { create_admin_user  }
  end  

  it_behaves_like "Common Read API" do
    let(:no_roles_user) { create_no_roles_user  }
    let(:user)          { create_user  }
    let(:admin_user)    { create_admin_user  }
  end  

  it_behaves_like "Common Validation API" do
    let(:no_roles_user) { create_no_roles_user  }
    let(:user)          { create_user  }
    let(:admin_user)    { create_admin_user  }
  end  

  it_behaves_like "Common Write API" do
    let(:no_roles_user) { create_no_roles_user  }
    let(:user)          { create_user  }
    let(:admin_user)    { create_admin_user  }
  end  
end 

# Customizing shared example groups
# 
# Here are three techniques for customizing shared groups:
# Parameterization
# 
# describe Host do
#   it_should_behave_like M, Host.new
# end
# 
# Here, the result of Host.new is passed to the shared group as a block parameter, making that value available at the group level (each example group is a class), and the instance level (each example runs in an instance of that class). So …
# 
# shared_examples_for M do |host|
#   it "can access #{host} in the docstring" do
#     host.do_something # it can access the host _in_ the example
#   end
# end
# 
# Methods defined in host group
# 
# describe Host do
#   let(:foo) { Host.new }
#   it_should_behave_like M
# end
# 
# In this case, the foo() method defined by let() is inherited by the generated nested group, and available within any of the examples defined in the shared group.
# 
# shared_examples_for M do
#   it "does something" do
#     foo
#   end
# end
# 
# NOTE that instance methods that are inherited like this are not available in the class scope of the generated example group, and are therefore not available for use in docstings:
# 
# shared_examples_for M do
#   it "does some #{foo}" do # this would raise an error
#     # ...
#   end
# end
# 
# Methods defined in an extension block
# 
# describe Host do
#   it_should_behave_like M do
#     let(:foo) { Host.new }
#   end
# end
# 
# The block passed to it_should_behave_like() is eval’d after the shared group is eval’d, allowing you to define default implementations of methods in the shared group. This means we can define groups that programmatically enforce rules for the host groups.
# 
