require 'behave/spec_helper'

class User  
end

describe Behave::Macros do
  describe '#behave!'
    it 'should add behaviors hash' do
      User.behave!
      User.behaviors.should be_empty
    end
  end
  
  describe '#behavior'  
    it 'should add behavior' do
      User.behavior(:my_behavior)
    end
  end

  describe '#has_behavior?'  
    it 'should have behavior' do
      User.has_behavior?(:my_behavior).should be_true
    end
  end  
end

