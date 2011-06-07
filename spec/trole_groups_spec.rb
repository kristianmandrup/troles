require 'trole'
require 'trole/macros'
require 'troles'

require 'trole_groups/api_spec'  # Trole API examples

describe TroleGroups do
  it "should be a module" do
    TroleGroups.should be_a(Module)
  end
end