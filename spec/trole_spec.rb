require 'trole'
require 'trole/macros'
require 'trole_spec_helper'

describe Trole do
  it "should be a module" do
    Trole.should be_a(Module)
  end
end