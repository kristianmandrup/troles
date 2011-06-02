require 'troles_spec'
User.troles_strategy :embed_many
User.valid_roles = [:user, :admin, :blogger]

describe Troles::Strategy::EmbedMany do
  let(:kris)    { Factory.create :user, :troles => [Role.create(:user)] } # :user role
  let(:susan)   { Factory.create :user, :name => 'susan', :troles => [Role.create(:admin)] } # :admin role
  let(:jack)    { Factory.create :user, :name => 'jack', :troles => [Role.create(:admin), Role.create(:user)] } # :user and :admin roles

  it_should_behave_like "a Many strategy for Kris"

  it_should_behave_like "a Many strategy for Susan"
  it_should_behave_like "a Many strategy for Jack"
