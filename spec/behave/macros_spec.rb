require 'behave/spec_helper'

class User  
end


module Hello
  class Configuration < Behave::Decorator::Configuration
    
    attr_writer :message
    
    def initialize subject_class, strategy, options = {}
      super
    end 
    
    def hello
      @message || 'default message'
    end
  end
end

module Hello
  module Api
    def hello
      behavior(:hello).configuration.message
    end
  end
  
  module Strategy
    module Default
      def self.included(base)
        base.send :include, Hello::Api
      end            
    end
  end
end

describe Behave::Macros do
  describe '#behave!'
    it 'should add behaviors hash' do
      User.behave!
      User.behaviors.should be_empty
    end
  end
  
  describe '#behavior'  
    before do
      Behave.add_behavior(:hello) do |behavior|
        behavior.configuration_class = MyBehavior::Configuration
      end    
    end

    it 'should add behavior' do
      User.behavior(:my_behavior)
    end
    
    it 'should configure User with hello method that returns message' do
      User.behavior(:my_behavior).strategy :default do |c|
        c.message = 'hello'
      end.configure!
      
      User.hello.should == 'hello'
    end
  end

  describe '#has_behavior?'  
    it 'should have behavior' do
      User.has_behavior?(:my_behavior).should be_true
    end
  end  
end

