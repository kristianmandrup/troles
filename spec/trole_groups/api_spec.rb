# See http://blog.davidchelimsky.net/2010/11/07/specifying-mixins-with-shared-example-groups-in-rspec-2/
# And: http://relishapp.com/rspec/rspec-core/v/2-6/dir/example-groups/shared-examples
# Also: http://stackoverflow.com/questions/6152359/dynamically-generating-shared-examples-in-rspec-2

require_all File.dirname(__FILE__) + '/api'

def define_users
  let(:no_roles_user) { create_no_roles_user  }
  let(:user)          { create_user  }
  let(:admin_user)    { create_admin_user  }
end  

shared_examples_for "TroleGroup API" do
  include UserSetup 
     
  it_behaves_like "TroleGroup Core API" do
    define_users
  end  

  it_behaves_like "TroleGroup Read API" do
    define_users
  end  

  it_behaves_like "TroleGroup Write API" do
    define_users
  end  
end