def migrate_up
  migrate :bit_many
end

require 'active_record_helper'
require 'troles_spec'

User.troles_strategy :bit_many
User.valid_roles = [:user, :admin, :blogger]

describe Troles::Common::Marshaller::Bitmask do
  let(:kris)    { Factory.create :user, :troles => 4}
  let(:bitmask) { Troles::Common::Marshaller::Bitmask.new kris }  

  subject { bitmask }
  specify { bitmask.read.should == [:blogger] }    
    specify { bitmask.write(:admin).should == 2 }
    specify { bitmask.write(:user, :admin).should == 3 }    
    
end