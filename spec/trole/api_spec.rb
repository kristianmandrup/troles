require_all File.dirname(__FILE__) + '/api'

shared_examples_for "Trole API" do
  include UserSetup 
     
  it_behaves_like "Trole Core API" do
    let(:no_roles_user) { create_no_roles_user  }
    let(:user)          { create_user  }
    let(:admin_user)    { create_admin_user  }
  end  

  it_behaves_like "Trole Cache API" do
    let(:no_roles_user) { create_no_roles_user  }
    let(:user)          { create_user  }
    let(:admin_user)    { create_admin_user  }
  end  

  it_behaves_like "Trole Event API" do
    let(:no_roles_user) { create_no_roles_user  }
    let(:user)          { create_user  }
    let(:admin_user)    { create_admin_user  }
  end  

  it_behaves_like "Trole Read API" do
    let(:no_roles_user) { create_no_roles_user  }
    let(:user)          { create_user  }
    let(:admin_user)    { create_admin_user  }
  end  

  it_behaves_like "Trole Validation API" do
    let(:no_roles_user) { create_no_roles_user  }
    let(:user)          { create_user  }
    let(:admin_user)    { create_admin_user  }
  end  

  it_behaves_like "Trole Write API" do
    let(:no_roles_user) { create_no_roles_user  }
    let(:user)          { create_user  }
    let(:admin_user)    { create_admin_user  }
  end  
end