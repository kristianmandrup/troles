require 'troles_spec'
User.troles_strategy :ref_many
User.valid_roles = [:user, :admin, :blogger]

describe Troles::Strategy::RefMany do
  let(:kris)    { Factory.create :user}

  it_should_behave_like "a Many strategy for Kris"

  # it_should_behave_like "a Many strategy for Susan"
  # it_should_behave_like "a Many strategy for Jack"
