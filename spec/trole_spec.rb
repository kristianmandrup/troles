require 'trole'
require 'trole/macros'
require 'trole_spec_helper'

require 'troles'
require 'trole/shared_examples'

describe Trole do
  it "should be a module" do
    Trole.should be_a(Module)
  end
end