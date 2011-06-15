# This is to test how you can add behaviors to the set of global behaviors!describe Behave::Macros do

describe Behave do

  describe '#add_behavior'
    it 'should add a named behavior' do
      Behave.add_behavior(:hello).should be_a(Behave::Decorator)
    end

    it 'should add a behavior with config class' do
      Behave.add_behavior(:hello) do |behavior|
        behavior.config = MyBehavior::Config
      end
      
      Behave.behaviors[:hello].config.should == MyBehavior::Config
    end
  end

  describe '#behaviors'  
    it 'should contain global behaviors' do
      Behave.behaviors.should_not be_empty
    end
    
    it 'should have hello' do
      Behave.behaviors[:hello].should be_a(Behave::Decorator)
    end
  end

  describe 'behavior'  
    it 'should have behavior' do
      Behave.behaviors[:hello].config .should be_a(Behave::Config)
    end
  end  
end

