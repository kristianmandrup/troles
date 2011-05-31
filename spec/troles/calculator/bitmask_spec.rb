require 'troles_spec'

describe Troles::Calculator::Bitmask do
  let(:bitmask) { Troles::Calculator::Bitmask.new :user, :admin, :blogger }  

  subject { bitmask }
    specify { bitmask.calc_index(:admin).should == 2 }
    specify { bitmask.get_roles(2).should == [:admin] }    
    specify { bitmask.calc_bitmask(:user, :admin).should == 3 }    
    
end