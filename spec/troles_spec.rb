require 'troles'
require 'troles/macros'
require 'troles/common/api_spec' # Common API examples
require 'troles/api_spec'  # Troles API examples

describe Troles do
  it "should be a module" do
    Troles.should be_a(Module)
  end
end