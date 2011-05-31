require 'rspec'
require 'trole'
require 'trole/macros'

describe Trole do
  it "should be a module" do
    Trole.should be_a(Module)
  end
end