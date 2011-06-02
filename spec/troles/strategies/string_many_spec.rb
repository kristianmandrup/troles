require 'troles_spec'
User.troles_strategy :string_many
User.valid_roles = [:user, :admin, :blogger]

describe Troles::Strategy::StringMany do
  let(:kris)    { Factory.create :user, :troles => 'user' } # :user role
  let(:susan)   { Factory.create :user, :name => 'susan', :troles => 'admin' } # :admin role
  let(:jack)    { Factory.create :user, :name => 'jack', :troles => 'user,admin' } # :user and :admin roles

  it_should_behave_like "a Many strategy for Kris"

  it_should_behave_like "a Many strategy for Susan"
  it_should_behave_like "a Many strategy for Jack"
