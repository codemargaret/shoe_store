require 'spec_helper'

describe(Brand) do
  it { should have_and_belong_to_many :stores }

  it 'validates presence of name' do
    brand = Brand.new({:name => ""})
    expect(brand.save).to eq false
  end

  # it 'validates presence of price' do
  #   brand = Brand.new({:price => ""})
  #   expect(brand.save).to eq false
  # end

  it 'only accepts a name that is at most 100 characters' do
    brand = Brand.new({:name => "a".*(101)})
    expect(brand.save).to eq false
  end

  it 'only accepts a name that is unique' do
    brand1 = Brand.new({:name => "Cheetah"})
    brand2 = Brand.new({:name => "Cheetah"})
    brand1.save
    expect(brand2.save).to eq false
  end

  it 'capitalizes the first letter of a name' do
    brand = Brand.new({:name => "cheetah"})
    brand.save
    expect(brand.name).to eq "Cheetah"
  end
end
