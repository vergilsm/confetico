require 'rails_helper'

RSpec.describe CartItem, type: :model do
  let(:cart_item) {create(:cart_item)}
  let(:item) {build(:item, id: 1)}

  it "exists?" do
    expect(cart_item).to be_truthy
  end

  it 'total_price' do
    item.save
    cart_item.save
    total = cart_item.quantity * item.price

    expect(cart_item.total_price).to eq total
  end
end
