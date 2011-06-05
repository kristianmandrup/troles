require 'trole'
require 'trole/macros'
require 'troles'

require 'troles/common/api_spec' # Common API examples
require 'trole/api_spec'  # Trole API examples

describe Trole do
  it "should be a module" do
    Trole.should be_a(Module)
  end
end