shared_examples_for "TrolegroupGroup Read API" do
  specify { user.has_rolegroup?(:blog_admin).should be_true }
  specify { user.is_rolegroup?(:blog_admin).should be_false }
        
  specify { user.has_rolegroups?(:blog_admin).should be_true }
  specify { user.has_rolegroups?(:blog_admin, :super_admin).should be_true }
        
  specify { user.has_any_rolegroup?(:blog_admin, :admin).should be_true }
  specify { user.has_any_rolegroup?(:super_admin).should be_true }       
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