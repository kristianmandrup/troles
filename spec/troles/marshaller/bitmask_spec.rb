require 'troles_spec'
User.role_strategy :bit_many
User.valid_roles = [:user, :admin, :blogger]

describe Troles::Marshaller::Bitmask do
  let(:kris)    { Factory.create :user, :troles => 4}
  let(:bitmask) { Troles::Marshaller::Bitmask.new kris }  

  subject { bitmask }
  specify { bitmask.read.should == [:blogger] }    
    specify { bitmask.write(:admin).should == 2 }
    specify { bitmask.write(:user, :admin).should == 3 }    
    
end