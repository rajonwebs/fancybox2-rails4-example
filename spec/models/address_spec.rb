require 'rails_helper'

describe Address do
  it 'has a valid factory' do
    expect(create(:address)).to be_valid
  end

  it 'is invalid without a street' do
    record = build(:address, street: nil)
    record.valid?
    expect(record.errors[:street].size).to eq(1)
  end

  it 'is invalid without a name of at least 3 chars' do
    record = build(:address, name: nil)
    record.valid?
    expect(record.errors[:name].size).to eq(2)
  end

  it 'is invalid with a duplicate name' do
    create(:address, name: 'Betty')
    address = build(:address, name: 'Betty')
    address.valid?
    expect(address.errors[:name].size).to eq(1)
  end
end
