require_all File.dirname(__FILE__) + '/api'

shared_examples_for "Troles API" do
  include UserSetup 
     
  it_behaves_like "Troles Core API" do
    let(:no_roles_user) { create_no_roles_user  }
    let(:user)          { create_user  }
    let(:admin_user)    { create_admin_user  }
  end  

  it_behaves_like "Troles Cache API" do
    let(:no_roles_user) { create_no_roles_user  }
    let(:user)          { create_user  }
    let(:admin_user)    { create_admin_user  }
  end  

  it_behaves_like "Troles Event API" do
    let(:no_roles_user) { create_no_roles_user  }
    let(:user)          { create_user  }
    let(:admin_user)    { create_admin_user  }
  end  

  it_behaves_like "Troles Read API" do
    let(:no_roles_user) { create_no_roles_user  }
    let(:user)          { create_user  }
    let(:admin_user)    { create_admin_user  }
  end  

  it_behaves_like "Troles Validation API" do
    let(:no_roles_user) { create_no_roles_user  }
    let(:user)          { create_user  }
    let(:admin_user)    { create_admin_user  }
  end  

  it_behaves_like "Troles Write API" do
    let(:no_roles_user) { create_no_roles_user  }
    let(:user)          { create_user  }
    let(:admin_user)    { create_admin_user  }
  end  
end