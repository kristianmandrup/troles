require 'rspec'
require 'troles'
require 'troles/macros'

describe Troles do
  it "should be a module" do
    Troles.should be_a(Module)
  end
end