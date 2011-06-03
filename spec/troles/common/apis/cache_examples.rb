shared_examples_for "Cache API" do
  describe '#invalidate_role_cache!' do
    before :each do
      user.role_list
      user.invalidate_role_cache!                                     
    end

    # should invalidate role cache, forcing update of @role_list instance var    
    expect { kris.role_list }.to change { kris.instance_variable_get "@role_list" }
  end
end

# specify { user.role_list.should == [:admin, :blogger] }
# it { should be_valid }            
# its(:errors) { should be_empty }
# ################################################################################
# # specify (generated descriptions)
# # instead of repeating expectation with: it "should not be published"...)
# specify { blog_post.should_not be_published }
# 
# ################################################################################
# # subject (delegate should/should_not to subject)
# subject { BlogPost.new :title => 'foo', :body => 'bar' }
#  it "sets published timestamp" do
#    subject.publish!
#    subject.should be_published
#  end
# 
# it { should be_valid }
# its(:errors) { should be_empty }
# its(:title) { should == 'foo' }
