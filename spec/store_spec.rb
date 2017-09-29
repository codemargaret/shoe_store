require 'spec_helper'

describe(Store) do
  it { should have_and_belong_to_many :brands }

  it 'validates presence of name' do
    store = Store.new({:name => ""})
    expect(store.save).to eq false
  end

  it("only accepts input that is at most 100 characters") do
    store = Store.new({:name => "a".*(101)})
    expect(store.save).to eq false
  end
end
