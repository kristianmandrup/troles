require 'troles'
require 'troles/macros'
require 'trole_spec_helper'
require 'troles/shared_examples'

describe Troles do
  it "should be a module" do
    Troles.should be_a(Module)
  end
end