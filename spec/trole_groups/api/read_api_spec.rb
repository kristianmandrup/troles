shared_examples_for "TroleGroup Read API" do

  specify { user.has_rolegroup?(:blog_admin).should be_true }
  
  it "only be in role groups" do
    user.only_in_rolegroup?(:blog_admin).should be_true
    user.add_rolegroups :super_admin    
    user.only_in_rolegroup?(:blog_admin).should be_false
    user.remove_rolegroups :super_admin
  end
        
  specify { user.has_rolegroups?(:blog_admin).should be_true }
  
  it "should be in 2 role groups" do
    user.add_rolegroups :super_admin      
    user.has_rolegroups?(:blog_admin, :super_admin).should be_true
    user.has_any_rolegroup?(:super_admin).should be_true    

    # adding single roles and role groups together produces union of roles from all :)
    user.add_roles :editor    
    user.role_list.should include(:blogger, :blog_editor, :admin, :blog_admin)
  end
        
  specify { user.has_any_rolegroup?(:blog_admin, :admin).should be_true }
  specify { user.has_any_rolegroup?(:blip).should be_false }       

  subject { user }
    its(:rolegroup_list) { should include(:blog_admin) }

  it 'should cache the rolegroup list' do
    user.rolegroup_list.should include(:blog_admin)
    # calling rolegroup_list multiple times should NOT invalidate the cache :)
    expect { user.rolegroup_list }.to_not change{ user.rolegroup_list_value }
    user.rolegroup_list.should include(:blog_admin)
  end
end