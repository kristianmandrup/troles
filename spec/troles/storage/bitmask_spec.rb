require 'troles_spec'

describe Troles::Strategy::BitMany::Storage::Bitmask do
  let(:bitmask) { Troles::Strategy::BitMany::Storage::Bitmask.new :user, :admin, :blogger }  

  subject { bitmask }
    specify { bitmask.calc_index(:admin).should == 2 }
    specify { bitmask.get_roles(2).should == [:admin] }    
    specify { bitmask.calc_bitmask(:user, :admin).should == 3 }    
    
end