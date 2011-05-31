require 'troles_spec'

STRATEGY = :bit_many

require 'troles/models'

describe Troles::Strategy::BitMany do
  let(:user) { User.new }
  subject { user }
    its(:role_field)  { should == :troles }
    its(:roles)       { should be_a Troles::Operations }
    its(:role_list)   { should include(:admin, :blogger) }

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


end