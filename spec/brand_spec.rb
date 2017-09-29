require 'spec_helper'

describe(Brand) do
  it { should have_and_belong_to_many :stores }

  it 'validates presence of name' do
    brand = Brand.new({:name => ""})
    expect(brand.save).to eq false
  end

  it("only accepts input that is at most 100 characters") do
    brand = Brand.new({:name => "a".*(101)})
    expect(brand.save).to eq false
  end
end
