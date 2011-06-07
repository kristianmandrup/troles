require_all File.dirname(__FILE__) + '/api'

def define_users
  let(:no_roles_user) { create_no_roles_user  }
  let(:user)          { create_user  }
  let(:admin_user)    { create_admin_user  }
end  

shared_examples_for "Troles API" do
  include UserSetup 
     
  it_behaves_like "Troles Core API" do
    define_users
  end  

  it_behaves_like "Troles Cache API" do
    define_users
  end  

  it_behaves_like "Troles Event API" do
    define_users
  end  

  it_behaves_like "Troles Read API" do
    define_users
  end  

  it_behaves_like "Troles Validation API" do
    define_users
  end  

  it_behaves_like "Troles Write API" do
    define_users
  end  
end